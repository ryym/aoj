package main

import (
	"bufio"
	"fmt"
	"os"
	"strconv"
)

func main() {
	var nNodes int
	fmt.Scan(&nNodes)

	sc := bufio.NewScanner(os.Stdin)
	sc.Split(bufio.ScanWords)

	keys := make([]int, 0, nNodes+1)
	keys = append(keys, 0) // padding
	for i := 0; i < nNodes && sc.Scan(); i++ {
		key, err := strconv.Atoi(sc.Text())
		if err != nil {
			panic(err)
		}
		keys = append(keys, key)
	}

	out := bufio.NewWriter(os.Stdout)
	for i := 1; i < len(keys); i++ {
		out.WriteString(fmt.Sprintf("node %d: key = %d, ", i, keys[i]))
		if p := i / 2; 0 < p {
			out.WriteString(fmt.Sprintf("parent key = %d, ", keys[p]))
		}
		if l := i * 2; l < len(keys) {
			out.WriteString(fmt.Sprintf("left key = %d, ", keys[l]))
		}
		if r := i*2 + 1; r < len(keys) {
			out.WriteString(fmt.Sprintf("right key = %d, ", keys[r]))
		}
		out.WriteString("\n")
		out.Flush()
	}
}
