/* ALDS1_2_A: Bubble Sort */

// ScalaのIntは`immutable.Range`を生成する`to`や`until`
// メソッドを持っているので、問題の擬似コードをほぼ
// そのままコードに起こせる。

import scala.io.StdIn.{readLine, readInt}

object Main extends App {
  val length = readInt()
  var inputs = readLine().split(" ").map(_.toInt)
  var nSwapped = 0

  def swap[T](array: Array[T], l: Int, r: Int) {
    val left = array(l)
    array(l) = array(r)
    array(r) = left
  }

  for (i <- 0 until length) {
    for {
      j <- length - 1 until i by -1
      if inputs(j) < inputs(j - 1)
    } {
      swap(inputs, j, j - 1)
      nSwapped += 1
    }
  }

  println(inputs mkString " ")
  println(nSwapped)
}
