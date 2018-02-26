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
