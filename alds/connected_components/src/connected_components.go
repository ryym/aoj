package main

import (
	"bufio"
	"fmt"
	"os"
	"strconv"
)

func main() {
	sc := bufio.NewScanner(os.Stdin)
	sc.Split(bufio.ScanWords)

	nNodes := scanInt(sc)
	nConns := scanInt(sc)

	graph := make([][]int, nNodes)
	for i := 0; i < nConns; i++ {
		a, b := scanInt(sc), scanInt(sc)
		graph[a] = append(graph[a], b)
		graph[b] = append(graph[b], a)
	}

	groups := make([]int, nNodes)

	var setGroups func(int, int)
	setGroups = func(u int, groupId int) {
		if groups[u] > 0 {
			return
		}
		groups[u] = groupId

		for _, v := range graph[u] {
			setGroups(v, groupId)
		}
	}
	for i := 0; i < nNodes; i++ {
		setGroups(i, i+1)
	}

	nQuestions := scanInt(sc)

	w := bufio.NewWriter(os.Stdout)
	var ans string
	for i := 0; i < nQuestions; i++ {
		a, b := scanInt(sc), scanInt(sc)
		if groups[a] == groups[b] {
			ans = "yes"
		} else {
			ans = "no"
		}
		fmt.Fprintln(w, ans)
	}
	w.Flush()
}

func scanInt(sc *bufio.Scanner) int {
	sc.Scan()
	v, _ := strconv.Atoi(sc.Text())
	return v
}
