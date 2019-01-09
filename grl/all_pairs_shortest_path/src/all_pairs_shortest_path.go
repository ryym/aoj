package main

import (
	"bufio"
	"fmt"
	"math"
	"os"
	"strconv"
)

const nothing = math.MaxInt64

func main() {
	sc := bufio.NewScanner(os.Stdin)
	sc.Split(bufio.ScanWords)

	nNodes := scanInt(sc)
	nEdges := scanInt(sc)

	d := make([][]int, nNodes)

	for i := 0; i < nNodes; i++ {
		d[i] = make([]int, nNodes)
		for j := 0; j < nNodes; j++ {
			if i == j {
				d[i][j] = 0
			} else {
				d[i][j] = nothing
			}
		}
	}

	for i := 0; i < nEdges; i++ {
		from := scanInt(sc)
		to := scanInt(sc)
		cost := scanInt(sc)
		d[from][to] = cost
	}

	floyd(d)

	if hasNegativeCycle(d) {
		fmt.Println("NEGATIVE CYCLE")
	} else {
		w := bufio.NewWriter(os.Stdout)
		for _, costs := range d {
			for ic, c := range costs {
				if ic > 0 {
					fmt.Fprint(w, " ")
				}
				if c == nothing {
					fmt.Fprint(w, "INF")
				} else {
					fmt.Fprint(w, c)
				}
			}
			fmt.Fprintln(w)
		}
		w.Flush()
	}
}

func floyd(d [][]int) {
	n := len(d)

	// i -> j について、 0~k までのノードのみを経由可能とした場合に
	// コストが最小となる経路のコストを d[i][j] にセットしていく。
	// 0~k の経路を使う最小コストを基に 0~k+1 の経路を使う最小コストを求めていく。
	for k := 0; k < n; k++ {
		for i := 0; i < n; i++ {
			if d[i][k] == nothing {
				continue
			}
			for j := 0; j < n; j++ {
				if d[k][j] == nothing {
					continue
				}
				d[i][j] = min(
					// k を経由しない場合
					d[i][j],
					// k を経由する場合
					d[i][k]+d[k][j],
				)
			}
		}
	}
}

// ワーシャルフロイドは各ノード間でコストが最小の経路を探すので、
// 経路の重み合計が負となるような閉路 (negative cycle) があるとうまくいかない
// (無限にコストを小さく出来てしまう)。そのような閉路がある場合は自分から自分への
// 最小コストが負になる (無ければ 0) 。
func hasNegativeCycle(d [][]int) bool {
	for i := 0; i < len(d); i++ {
		if d[i][i] < 0 {
			return true
		}
	}
	return false
}

func min(a, b int) int {
	if a < b {
		return a
	}
	return b
}

func scanInt(sc *bufio.Scanner) int {
	sc.Scan()
	v, _ := strconv.Atoi(sc.Text())
	return v
}
