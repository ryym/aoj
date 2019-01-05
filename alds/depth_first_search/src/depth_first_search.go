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

	starts := make([]int, nVerts+1)
	ends := make([]int, nVerts+1)
	time := 1

	var dfs func(u int)
	dfs = func(u int) {
		if starts[u] > 0 {
			return
		}

		starts[u] = time
		time += 1

		for _, v := range graph[u] {
			dfs(v)
		}

		ends[u] = time
		time += 1
	}

	for i := 1; i <= nVerts; i++ {
		dfs(i)
	}

	w := bufio.NewWriter(os.Stdout)
	for i := 1; i <= nVerts; i++ {
		fmt.Fprintf(w, "%d %d %d\n", i, starts[i], ends[i])
	}
	w.Flush()
}

func scanInt(sc *bufio.Scanner) int {
	sc.Scan()
	v, _ := strconv.Atoi(sc.Text())
	return v
}
