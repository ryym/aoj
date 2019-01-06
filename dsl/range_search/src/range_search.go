// 実装は問題ないはずだけど、 Go だと Time Limit Exceeded になっちゃう。
// 手元で in13.txt でテストすると Go は2.5秒、C++ でも1.5秒なのでしょうがないっぽい。

package main

import (
	"bufio"
	"fmt"
	"os"
	"sort"
	"strconv"
)

type Point struct {
	id int
	x  int
	y  int
}

type Tree struct {
	location int
	left     *Tree
	right    *Tree
}

type Points struct {
	points []Point
	less   func(points []Point, i, j int) bool
}

func (p Points) Len() int {
	return len(p.points)
}

func (p Points) Less(i, j int) bool {
	return p.less(p.points, i, j)
}

func (p Points) Swap(i, j int) {
	p.points[i], p.points[j] = p.points[j], p.points[i]
}

func main() {
	sc := bufio.NewScanner(os.Stdin)
	sc.Split(bufio.ScanWords)

	nPoints := scanInt(sc)

	points := make([]Point, nPoints)
	for i := 0; i < nPoints; i++ {
		points[i] = Point{
			id: i,
			x:  scanInt(sc),
			y:  scanInt(sc),
		}
	}

	tree := make2DTree(points, 0, nPoints, 0)

	nQuestions := scanInt(sc)
	w := bufio.NewWriter(os.Stdout)

	find := makePointFinder(tree, points)
	for i := 0; i < nQuestions; i++ {
		sx, tx := scanInt(sc), scanInt(sc)
		sy, ty := scanInt(sc), scanInt(sc)

		ids := find(sx, tx, sy, ty)
		sort.Ints(ids)
		for _, i := range ids {
			fmt.Fprintln(w, i)
		}
		fmt.Fprintln(w)
	}
	w.Flush()
}

// x軸, y軸を交互に基準にして二分木を作る。
// 座標におけるイメージだと、座標上に散らばる点のうち中間にある点を選んで
// 線を引き、区画に分けていく。これを x, y 方向に交互に繰り返す。
// すると指定された範囲内にある点を調べるには、その範囲と重なる
// 区画だけ調べればいい。
func make2DTree(points []Point, l, r, depth int) *Tree {
	if l >= r {
		return nil
	}

	mid := (l + r) / 2
	ps := points[l:r]

	if depth%2 == 0 {
		sort.Sort(Points{ps, sortByX})
	} else {
		sort.Sort(Points{ps, sortByY})
	}

	leftTree := make2DTree(points, l, mid, depth+1)
	rightTree := make2DTree(points, mid+1, r, depth+1)
	return &Tree{
		location: mid,
		left:     leftTree,
		right:    rightTree,
	}
}

func makePointFinder(wholeTree *Tree, points []Point) func(sx, tx, sy, ty int) []int {
	var ids []int

	shouldSearch := func(depth int, start, end, p Point) (bool, bool) {
		if depth%2 == 0 {
			return start.x <= p.x, p.x <= end.x
		} else {
			return start.y <= p.y, p.y <= end.y
		}
	}

	var find func(tree *Tree, start, end Point, depth int)
	find = func(tree *Tree, start, end Point, depth int) {
		p := points[tree.location]

		if start.x <= p.x && p.x <= end.x && start.y <= p.y && p.y <= end.y {
			ids = append(ids, p.id)
		}

		left, right := shouldSearch(depth, start, end, p)
		if left && tree.left != nil {
			find(tree.left, start, end, depth+1)
		}
		if right && tree.right != nil {
			find(tree.right, start, end, depth+1)
		}
	}

	return func(sx, tx, sy, ty int) []int {
		ids = make([]int, 0)
		start := Point{0, sx, sy}
		end := Point{0, tx, ty}
		find(wholeTree, start, end, 0)
		return ids
	}
}

func sortByX(points []Point, i, j int) bool {
	return points[i].x < points[j].x
}

func sortByY(points []Point, i, j int) bool {
	return points[i].y < points[j].y
}

func scanInt(sc *bufio.Scanner) int {
	sc.Scan()
	v, _ := strconv.Atoi(sc.Text())
	return v
}
