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
	matrix := make([][]int, nVerts)

	for iv := 0; iv < nVerts; iv++ {
		u := scanInt(sc)
		nDegrees := scanInt(sc)

		matrix[u-1] = make([]int, nVerts)
		for id := 0; id < nDegrees; id++ {
			v := scanInt(sc)
			matrix[u-1][v-1] = 1
		}
	}

	w := bufio.NewWriter(os.Stdout)
	for _, row := range matrix {
		for i, v := range row {
			if i > 0 {
				fmt.Fprint(w, " ")
			}
			fmt.Fprint(w, v)
		}
		fmt.Fprintln(w)
	}
	w.Flush()
}

func scanInt(sc *bufio.Scanner) int {
	sc.Scan()
	v, _ := strconv.Atoi(sc.Text())
	return v
}
