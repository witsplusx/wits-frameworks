package com.wits.frameworks.commons.testcase.kotlin

/**
 * 工程名称：wits-frameworks
 * 类路径：com.wits.frameworks.commons.testcase.kotlin
 * 团队名称：witshine
 *
 * @author wodedipan605891@gmail.com
 * @createdate 2018-12-29 14:08
 * @desc
 * @see
 */

fun main(args: Array<String>) {
    println("Hello World!")
    vars(1, 3, 5, 4, 5)

    //lambda
    val sumLambda: (Int, Int) -> Int = {x,y -> x+y}
    println(sumLambda(6,9))
}

fun sum(a: Int, b: Int): Int {
    return a + b
}

fun sum2(a: Int, b: Int) = a + b

public fun sum3(a: Int, b: Int): Int = a + b

fun printSum(a: Int, b: Int): Unit {
    print(a+b)
}

public fun printSum2(a: Int, b: Int) {
    print(a+b)
}

fun vars(vararg v:Int) {
    for(vt in v) {
        print(vt)
    }
}


fun test() {
    val a = 1
    val b: Int = 2
    val c: Int

    c = 9

    var x = 5
    x += 1
}

fun test2() {
    var a = 1
    val s1 = "a is $a"

    a = 2
    val s2 = "${s1.replace("is", "was")}, but now is $a"
}

fun nullTest() {
    var age: String? = "23"

}



