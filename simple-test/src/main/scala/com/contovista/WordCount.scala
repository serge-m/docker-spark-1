package com.contovista

import org.apache.spark.{ SparkConf, SparkContext }

object WordCount {
  
  def main(args: Array[String]): Unit = {
    
    val infile = args(0)
    val outfile = args(1)

    val conf = new SparkConf().setAppName("WordCount")
    val sparkContext = new SparkContext()

    val words = sparkContext.textFile(infile)

    val counted = words
      .map(_ -> 1)
      .reduceByKey(_ + _)
      .map { case (word, count) => s"$word: $count" }

    counted.saveAsTextFile(outfile)
  }
}
