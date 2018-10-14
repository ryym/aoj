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

	size := scanInt(sc)
	heap := make([]int, size+1)
	for i := 1; i <= size; i++ {
		heap[i] = scanInt(sc)
	}

	buildMaxHeap(size, heap)

	out := bufio.NewWriter(os.Stdout)
	for i := 1; i < len(heap); i++ {
		fmt.Fprintf(out, " %d", heap[i])
	}
	out.WriteString("\n")
	out.Flush()
}

// 子を持つ最大の節点 (at size/2) から maxHeapify を上に向かって繰り返す。
// これにより、maxHeapify(heap, i) を行なう時、 i の左右の子は既に
// maxHeapify 済みとなるので、各サブツリーの下の方により大きな値がある
// 可能性を考えずに済む。
func buildMaxHeap(size int, heap []int) {
	for i := size / 2; i > 0; i-- {
		maxHeapify(size, heap, i)
	}
}

// idx とその左右の子を比べて、 idx にある値の方が小さかったら
// それをツリーの下の方へ押しやっていく。
func maxHeapify(size int, heap []int, idx int) {
	left := idx * 2
	right := left + 1
	largest := idx

	if left <= size {
		if heap[left] > heap[idx] {
			largest = left
		}
		if right <= size && heap[right] > heap[largest] {
			largest = right
		}
	}

	if largest != idx {
		// 親子間で上下関係が保てれば良く、兄弟間に順序はない。
		heap[idx], heap[largest] = heap[largest], heap[idx]

		// 元 idx にあった値と更に下のツリーの値とを比べていく。
		maxHeapify(size, heap, largest)
	}
}

func scanInt(sc *bufio.Scanner) int {
	sc.Scan()
	v, _ := strconv.Atoi(sc.Text())
	return v
}
