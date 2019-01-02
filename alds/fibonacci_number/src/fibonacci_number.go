package main

import (
	"bufio"
	"fmt"
	"os"
	"strconv"
)

var dp []int

func main() {
	sc := bufio.NewScanner(os.Stdin)
	sc.Scan()
	n, _ := strconv.Atoi(sc.Text())

	dp = make([]int, n+1)
	fmt.Println(fib(n))
}

func fib(n int) int {
	if n <= 1 {
		return 1
	}
	if dp[n] > 0 {
		return dp[n]
	}
	m := fib(n-1) + fib(n-2)
	dp[n] = m
	return m
}
