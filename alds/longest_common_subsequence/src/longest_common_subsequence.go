package main

import "fmt"

func main() {
	var nPairs int
	fmt.Scanln(&nPairs)

	var a, b string
	for i := 0; i < nPairs; i++ {
		fmt.Scanln(&a)
		fmt.Scanln(&b)
		fmt.Println(lcsSize(a, b))
	}
}

func lcsSize(sa, sb string) int {
	dp := make([][]int, len(sa)+1)
	for i := 0; i <= len(sa); i++ {
		dp[i] = make([]int, len(sb)+1)
	}

	for a := 1; a <= len(sa); a++ {
		for b := 1; b <= len(sb); b++ {
			if sa[a-1] == sb[b-1] {
				dp[a][b] = dp[a-1][b-1] + 1
			} else {
				dp[a][b] = max(dp[a][b-1], dp[a-1][b])
			}
		}
	}

	return dp[len(sa)][len(sb)]
}

func max(a, b int) int {
	if a > b {
		return a
	}
	return b
}
