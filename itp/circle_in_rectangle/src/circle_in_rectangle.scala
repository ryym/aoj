/* ITP1_2_D: Circle in a Rectangle */

import scala.io.StdIn.{readLine, readInt}

object Main {
  val centerX: Int = 0
  val centerY: Int = 0

  def main(args: Array[String]): Unit = {
    val inputs = readLine().split(" ").map(_.toInt)
    val within = withinRect(inputs)
    println( if (within) "Yes" else "No" )
  }

  def withinRect(inputs: Seq[Int]): Boolean = {
    val Seq(width, height, x, y, radius) = inputs
    val distances = List(
      x - centerX,
      y - centerY,
      width - x,
      height - y
    )
    distances.forall(_ >= radius)
  }
}
