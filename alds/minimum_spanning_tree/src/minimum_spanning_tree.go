package main

import (
	"bufio"
	"fmt"
	"os"
	"strconv"
)

const BIG_COST = 3000

const (
	ST_NOT_YET = iota
	ST_JOINED
)

func main() {
	sc := bufio.NewScanner(os.Stdin)
	sc.Split(bufio.ScanWords)

	nNodes := scanInt(sc)
	costs := make([][]int, nNodes)

	for r := 0; r < nNodes; r++ {
		costs[r] = make([]int, nNodes)
		for c := 0; c < nNodes; c++ {
			costs[r][c] = scanInt(sc)
		}
	}

	states := make([]int, nNodes)
	minCosts := make([]int, nNodes)

	for i := 1; i < nNodes; i++ {
		minCosts[i] = BIG_COST
	}

	for {
		var u int
		minCost := BIG_COST

		for i := 0; i < nNodes; i++ {
			if states[i] != ST_JOINED && minCosts[i] < minCost {
				minCost = minCosts[i]
				u = i
			}
		}

		// 全てのノードが MST に JOIN できたので終了。
		if minCost == BIG_COST {
			break
		}

		states[u] = ST_JOINED

		for v := 0; v < nNodes; v++ {
			cost := costs[u][v]

			// MST内の u と MST外の v との辺の重みをそれぞれ minCosts[v] として
			// 保存しておく。このうち辺の重みが最小となる v が次のループで MST に JOIN する。
			if states[v] != ST_JOINED && cost != -1 && cost < minCosts[v] {
				minCosts[v] = cost
			}
		}
	}

	// 螺旋本では p という配列を用意して MST の重みの合計を求めてる。
	// この方法でも AOJ のテストは通ったけど、何か問題がある..?
	sum := 0
	for _, cost := range minCosts {
		sum += cost
	}
	fmt.Println(sum)
}

func scanInt(sc *bufio.Scanner) int {
	sc.Scan()
	v, _ := strconv.Atoi(sc.Text())
	return v
}
