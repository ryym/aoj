package main

import (
	"bufio"
	"fmt"
	"os"
	"strconv"
)

type Queue []int

func (q *Queue) push(v int) {
	*q = append(*q, v)
}

func (q *Queue) pop() int {
	v := (*q)[0]
	*q = (*q)[1:]
	return v
}

func main() {
	sc := bufio.NewScanner(os.Stdin)
	sc.Split(bufio.ScanWords)

	nVerts := scanInt(sc)
	graph := make([][]int, nVerts+1)

	for i := 0; i < nVerts; i++ {
		u := scanInt(sc)
		nDegrees := scanInt(sc)

		graph[u] = make([]int, nDegrees)
		for d := 0; d < nDegrees; d++ {
			graph[u][d] = scanInt(sc)
		}
	}

	paths := make([]int, nVerts+1)

	queue := Queue(make([]int, 0))
	queue.push(1)
	paths[1] = 1

	for len(queue) > 0 {
		u := queue.pop()
		d := paths[u] + 1
		for _, v := range graph[u] {
			if paths[v] == 0 {
				paths[v] = d
				queue.push(v)
			}
		}
	}

	w := bufio.NewWriter(os.Stdout)
	for i := 1; i <= nVerts; i++ {
		fmt.Fprintf(w, "%d %d\n", i, paths[i]-1)
	}
	w.Flush()
}

func scanInt(sc *bufio.Scanner) int {
	sc.Scan()
	v, _ := strconv.Atoi(sc.Text())
	return v
}
