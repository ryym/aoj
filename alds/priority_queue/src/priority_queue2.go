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

	heap := NewHeap(func(a, b int) bool {
		return a > b
	})

	out := bufio.NewWriter(os.Stdout)
LOOP:
	for {
		sc.Scan()
		cmd := sc.Text()
		switch cmd {
		case "insert":
			v := scanInt(sc)
			heap.insert(v)
		case "extract":
			max := heap.extractMax()
			fmt.Fprintln(out, max)
		default:
			break LOOP
		}
	}
	out.Flush()
}

func scanInt(sc *bufio.Scanner) int {
	sc.Scan()
	v, _ := strconv.Atoi(sc.Text())
	return v
}

type Heap struct {
	size   int
	heap   []int
	isHigh func(a, b int) bool
}

func NewHeap(isHigh func(a, b int) bool) Heap {
	heap := make([]int, 1) // 先頭は不使用
	return Heap{size: 0, heap: heap, isHigh: isHigh}
}

func (h *Heap) insert(v int) {
	h.size += 1
	if h.size > len(h.heap)-1 {
		h.heap = append(h.heap, v)
	} else {
		h.heap[h.size] = v
	}

	for i := h.size; i > 1; {
		parent := i / 2
		if h.isHigh(h.heap[parent], h.heap[i]) {
			break
		}
		h.heap[i], h.heap[parent] = h.heap[parent], h.heap[i]
		i = parent
	}
}

func (h *Heap) extractMax() int {
	if h.size <= 0 {
		panic("cannot extract from empty heap")
	}

	max := h.heap[1]
	h.heap[1] = h.heap[h.size]
	h.size -= 1
	h.maxHeapify(1)

	return max
}

func (h *Heap) maxHeapify(idx int) {
	left := idx * 2
	right := left + 1
	largest := idx

	if left <= h.size {
		if h.isHigh(h.heap[left], h.heap[idx]) {
			largest = left
		}
		if right <= h.size && h.isHigh(h.heap[right], h.heap[largest]) {
			largest = right
		}
	}

	if largest != idx {
		h.heap[idx], h.heap[largest] = h.heap[largest], h.heap[idx]
		h.maxHeapify(largest)
	}
}
