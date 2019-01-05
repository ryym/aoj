package main

import (
	"bufio"
	"fmt"
	"os"
	"strconv"
)

const BIG_COST = 200000

func main() {
	sc := bufio.NewScanner(os.Stdin)
	sc.Split(bufio.ScanWords)

	nNodes := scanInt(sc)

	// 各頂点につながる頂点一覧を得るための隣接リスト
	graph := make([][]int, nNodes)

	// 各頂点同士の辺の重みを得るための隣接行列
	costs := make([][]int, nNodes)

	// 各頂点が調査済みかどうかを保持する配列
	checked := make([]bool, nNodes)

	// 0 から各頂点への最小コストを保存する配列
	costSums := make([]int, nNodes)

	for i := 0; i < nNodes; i++ {
		costs[i] = make([]int, nNodes)
		costSums[i] = BIG_COST
	}

	// graph, costs を生成
	for i := 0; i < nNodes; i++ {
		u := scanInt(sc)
		k := scanInt(sc)
		graph[u] = make([]int, k)
		for d := 0; d < k; d++ {
			v := scanInt(sc)
			graph[u][d] = v
			costs[u][v] = scanInt(sc)
		}
	}

	costSums[0] = 0

	// 0 から隣接する頂点へのコストを1つずつ調べていく。
	// 隣接する頂点を辿っていく事で、ある v への全ての経路を調べる
	// 事になるので、最終的には costSums に 0 から v への最小コストが
	// 格納される事になる。
	for {
		minCost := BIG_COST
		var u int

		for i, cost := range costSums {
			if !checked[i] && cost < minCost {
				minCost = cost
				u = i
			}
		}

		if minCost == BIG_COST {
			break
		}

		checked[u] = true

		for _, v := range graph[u] {
			// 既に costSums に値があっても、よりコストの小さい経路が
			// 見つかったらそれに置き換える。
			cost := minCost + costs[u][v]
			if cost < costSums[v] {
				costSums[v] = cost
			}
		}
	}

	w := bufio.NewWriter(os.Stdout)
	for i, cost := range costSums {
		fmt.Fprintf(w, "%d %d\n", i, cost)
	}
	w.Flush()
}

func scanInt(sc *bufio.Scanner) int {
	sc.Scan()
	v, _ := strconv.Atoi(sc.Text())
	return v
}
