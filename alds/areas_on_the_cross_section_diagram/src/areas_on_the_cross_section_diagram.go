// 水溜りの面積を横のラインの積み重ねとして捉える。
// 同じ高さにある'\'から'/'までの部分には必ず水がたまるから、
// スタックを使ってペアを作り、それらを合計していけばいい。
// これで総面積は求まるけど、個々の池の面積を出すにはもうひと工夫必要になる。

package main

import (
	"bufio"
	"fmt"
	"os"
)

var (
	CH_UP   = '/'
	CH_DOWN = '\\'
	CH_FLAT = '_'
)

// Go には Generics ないので仕方なく interface{}
type Stack []interface{}

func (s *Stack) push(v interface{}) {
	*s = append(*s, v)
}

func (s *Stack) top() interface{} {
	return (*s)[len(*s)-1]
}

func (s *Stack) pop() interface{} {
	v := s.top()
	*s = (*s)[:len(*s)-1]
	return v
}

type Pair struct {
	start int
	area  int
}

func main() {
	var s string
	fmt.Scanln(&s)

	starts := Stack(make([]interface{}, 0))
	areas := Stack(make([]interface{}, 0))

	for i, c := range s {
		switch c {
		case CH_DOWN:
			starts.push(i)
		case CH_UP:
			if len(starts) == 0 {
				continue
			}

			start := starts.pop().(int)
			area := i - start

			// 自分の'\'~'/'の範囲に含まれる、自分より下のラインの面積を累計する。
			// これで水溜りごとの面積の合計を出せる。
			for len(areas) > 0 {
				p := areas.top().(Pair)
				if start > p.start {
					break
				}
				area += p.area
				areas.pop()
			}

			areas.push(Pair{start, area})
		}
	}

	total := 0
	for _, p := range areas {
		total += p.(Pair).area
	}

	w := bufio.NewWriter(os.Stdout)
	fmt.Fprintln(w, total)

	fmt.Fprint(w, len(areas))
	for _, p := range areas {
		fmt.Fprintf(w, " %d", p.(Pair).area)
	}
	fmt.Fprintln(w)

	w.Flush()
}
