package main

import (
	"bufio"
	"fmt"
	"os"
	"strconv"
)

type Node struct {
	left  *Node
	val   int
	right *Node
}

func main() {
	var nOps int
	fmt.Scan(&nOps)

	sc := bufio.NewScanner(os.Stdin)
	sc.Split(bufio.ScanWords)

	var node *Node
	for i := 0; i < nOps; i++ {
		sc.Scan()
		switch sc.Text() {
		case "insert":
			sc.Scan()
			val, _ := strconv.Atoi(sc.Text())
			node = insert(node, val)
		case "find":
			sc.Scan()
			val, _ := strconv.Atoi(sc.Text())
			if contains(node, val) {
				fmt.Println("yes")
			} else {
				fmt.Println("no")
			}
		case "delete":
			sc.Scan()
			val, _ := strconv.Atoi(sc.Text())
			remove(node, val)
		case "print":
			printValues(listByInOrder(node, []int{}))
			printValues(listByPreOrder(node, []int{}))
		}
	}
}

func printValues(vs []int) {
	buf := bufio.NewWriter(os.Stdout)
	for _, v := range vs {
		buf.Write([]byte(fmt.Sprintf(" %d", v)))
	}
	buf.Write([]byte("\n"))
	buf.Flush()
}

func listByInOrder(node *Node, vs []int) []int {
	if node != nil {
		vs = listByInOrder(node.left, vs)
		vs = append(vs, node.val)
		vs = listByInOrder(node.right, vs)
	}
	return vs
}

func listByPreOrder(node *Node, vs []int) []int {
	if node != nil {
		vs = append(vs, node.val)
		vs = listByPreOrder(node.left, vs)
		vs = listByPreOrder(node.right, vs)
	}
	return vs
}

func insert(node *Node, val int) *Node {
	if node == nil {
		return &Node{nil, val, nil}
	}

	var parent *Node
	nd := node
	for nd != nil {
		parent = nd
		if nd.val > val {
			nd = nd.left
		} else {
			nd = nd.right
		}
	}

	if parent.val > val {
		parent.left = &Node{nil, val, nil}
	} else {
		parent.right = &Node{nil, val, nil}
	}

	return node
}

func contains(node *Node, val int) bool {
	switch {
	case node == nil:
		return false
	case node.val == val:
		return true
	case node.val > val:
		return contains(node.left, val)
	default:
		return contains(node.right, val)
	}
}

// 削除対象のノード z が子を持たない、もしくは1つだけ持つ場合は特に難しくない。
// ポイントは子を2つ持つ場合で、その場合は「中間順巡回で z の次に来る点」(次節点)
// の値を z の位置に持ってくるようにする。この次節点はつまり「z の右側の木の中で
// 最小の値」であるから、こいつを持ってくるようにすれば「あるノードの値はその
// 右側の木内のどの値よりも小さい」という二分木のルールを保てる。
func remove(node *Node, val int) {
	parent := &Node{nil, -1, node}

	// Find the target node.
	for node != nil {
		if node.val == val {
			break
		} else {
			parent = node
			if node.val < val {
				node = node.right
			} else {
				node = node.left
			}
		}
	}

	// If the node has two children, we replace the node value with
	// the minimum value of its right trree and remove the minimum node.
	if node.left != nil && node.right != nil {
		min, minParent := findMinNext(node)
		node.val = min.val
		node, parent = min, minParent
	}

	if node.left == nil && node.right == nil {
		if parent.left == node {
			parent.left = nil
		} else {
			parent.right = nil
		}
	} else {
		next := node.right
		if next == nil {
			next = node.left
		}
		if parent.left == node {
			parent.left = next
		} else {
			parent.right = next
		}
	}
}

func findMinNext(node *Node) (*Node, *Node) {
	parent := node
	min := node.right
	for min.left != nil {
		parent = min
		min = min.left
	}
	return min, parent
}
