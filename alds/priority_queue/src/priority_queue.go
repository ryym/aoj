package main

import (
	"bufio"
	"fmt"
	"os"
	"strconv"
)

var heapSize = 0

func main() {
	sc := bufio.NewScanner(os.Stdin)
	sc.Split(bufio.ScanWords)

	heap := make([]int, 1) // 先頭は不使用

	out := bufio.NewWriter(os.Stdout)
LOOP:
	for {
		sc.Scan()
		cmd := sc.Text()
		switch cmd {
		case "insert":
			v := scanInt(sc)
			heap = insert(heap, v)
		case "extract":
			max := extractMax(heap)
			fmt.Fprintln(out, max)
		default:
			break LOOP
		}
	}
	out.Flush()
}

func insert(heap []int, v int) []int {
	heapSize += 1
	if heapSize > len(heap)-1 {
		heap = append(heap, v)
	} else {
		heap[heapSize] = v
	}

	for i := heapSize; i > 1; {
		parent := i / 2
		if heap[parent] >= heap[i] {
			break
		}
		heap[i], heap[parent] = heap[parent], heap[i]
		i = parent
	}

	return heap
}

func extractMax(heap []int) int {
	if heapSize <= 0 {
		panic("cannot extract from empty heap")
	}

	max := heap[1]
	heap[1] = heap[heapSize]
	heapSize -= 1
	maxHeapify(heapSize, heap, 1)

	return max
}

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
		heap[idx], heap[largest] = heap[largest], heap[idx]
		maxHeapify(size, heap, largest)
	}
}

func scanInt(sc *bufio.Scanner) int {
	sc.Scan()
	v, _ := strconv.Atoi(sc.Text())
	return v
}
