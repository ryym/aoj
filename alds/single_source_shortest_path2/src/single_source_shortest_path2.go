package main

import (
	"bufio"
	"fmt"
	"os"
	"strconv"
)

const BIG_COST = 200000

type Path struct {
	node int
	cost int
}

func main() {
	sc := bufio.NewScanner(os.Stdin)
	sc.Split(bufio.ScanWords)

	nNodes := scanInt(sc)

	// 各頂点につながる頂点一覧を得るための隣接リスト。
	// ノード間の重みも一緒に保持する。
	graph := make([][]Path, nNodes)

	for i := 0; i < nNodes; i++ {
		u := scanInt(sc)
		k := scanInt(sc)
		graph[i] = make([]Path, k)
		for d := 0; d < k; d++ {
			graph[u][d] = Path{
				node: scanInt(sc),
				cost: scanInt(sc),
			}
		}
	}

	// 0 から各頂点への最小コストを保存する配列。
	minCosts := make([]int, nNodes)

	minCosts[0] = 0
	for i := 1; i < nNodes; i++ {
		minCosts[i] = BIG_COST
	}

	// 各頂点が調査済みかどうかを保持する配列
	checked := make([]bool, nNodes)

	// 最小コストのパスを高速に取得するためのヒープ。
	// コストが小さいものほどルートに来るようにする。
	heap := NewHeap(func(a, b Path) bool {
		return a.cost < b.cost
	})

	heap.insert(Path{node: 0, cost: 0})
	for heap.size > 0 {
		u := heap.extractMax()

		// 隣接行列を使っていた時とは違い、ヒープには
		// 同じノードへのパスが複数含まれうる。そのため既によりコストの低い
		// パスが見つかっている場合は無視する。
		if minCosts[u.node] < u.cost {
			continue
		}

		checked[u.node] = true

		for _, v := range graph[u.node] {
			cost := v.cost + u.cost
			if !checked[v.node] && cost < minCosts[v.node] {
				minCosts[v.node] = cost
				heap.insert(Path{node: v.node, cost: cost})
			}
		}
	}

	w := bufio.NewWriter(os.Stdout)
	for i, cost := range minCosts {
		fmt.Fprintf(w, "%d %d\n", i, cost)
	}
	w.Flush()
}

func scanInt(sc *bufio.Scanner) int {
	sc.Scan()
	v, _ := strconv.Atoi(sc.Text())
	return v
}

// --- From ALDS1_9_C: Priority Queue

type Heap struct {
	size   int
	heap   []Path
	isHigh func(a, b Path) bool
}

func NewHeap(isHigh func(a, b Path) bool) Heap {
	heap := make([]Path, 1) // 先頭は不使用
	return Heap{size: 0, heap: heap, isHigh: isHigh}
}

func (h *Heap) insert(v Path) {
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

func (h *Heap) extractMax() Path {
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
