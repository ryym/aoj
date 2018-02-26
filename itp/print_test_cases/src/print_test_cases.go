package main

import (
	"bufio"
	"fmt"
	"os"
	"strconv"
)

func main() {
	sc := bufio.NewScanner(os.Stdin)
	i := 1
	for sc.Scan() {
		n, _ := strconv.Atoi(sc.Text())
		if n == 0 {
			break
		}
		fmt.Printf("Case %d: %d\n", i, n)
		i++
	}
}
