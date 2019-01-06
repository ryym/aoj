// - 各要素に自身の代表となる要素 (へのパス) をもたせる。
// - その代表が同じ要素同士は同じ集合に属すると判定する。
// - 論理的な構造としては、各集合は代表をルートとする木構造になる。

package main

import (
	"bufio"
	"fmt"
	"os"
	"strconv"
)

const (
	COMMAND_UNITE = iota
	COMMAND_SAME
)

func main() {
	sc := bufio.NewScanner(os.Stdin)
	sc.Split(bufio.ScanWords)

	nItems := scanInt(sc)
	nQueries := scanInt(sc)

	roots := make([]int, nItems)
	for i := 0; i < nItems; i++ {
		roots[i] = i
	}

	// 各木の高さを保持する。
	ranks := make([]int, nItems)

	// 2回目以降のアクセスを高速化するため、再帰を使って
	// 各要素が直接ルートを持つようにする。
	// ただ、この経路圧縮はしなくても AOJ のテストはパスした。
	var findRoot func(int) int
	findRoot = func(x int) int {
		if roots[x] == x {
			return x
		}
		rx := findRoot(roots[x])
		roots[x] = rx
		return rx
	}

	w := bufio.NewWriter(os.Stdout)
	for i := 0; i < nQueries; i++ {
		command := scanInt(sc)
		x, y := scanInt(sc), scanInt(sc)
		rx := findRoot(x)
		ry := findRoot(y)

		switch command {
		case COMMAND_UNITE:
			// なるべく木の高さを抑えるため、より高い木を unite 後のルートに選ぶ。
			if ranks[rx] > ranks[ry] {
				roots[ry] = rx
			} else if ranks[rx] < ranks[ry] {
				roots[rx] = ry
			} else {
				roots[rx] = ry
				ranks[ry] += 1
			}
		case COMMAND_SAME:
			if rx == ry {
				fmt.Fprintln(w, 1)
			} else {
				fmt.Fprintln(w, 0)
			}
		}
	}
	w.Flush()
}

func scanInt(sc *bufio.Scanner) int {
	sc.Scan()
	v, _ := strconv.Atoi(sc.Text())
	return v
}
