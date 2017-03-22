//: Playground - noun: a place where people can play

import UIKit

//泛型代码让你能根据你所定义的要求写出可以用于任何类型的灵活的、可复用的函数。你可以编写出可复用、意图表达清晰、抽象的代码。

//泛型是 Swift 最强大的特性之一，很多 Swift 标准库是基于泛型代码构建的。实际上，甚至你都没有意识到在语言指南中一直在使用泛型。例如，Swift 的 Array 和 Dictionary 类型都是泛型集合。你可以创建一个容纳 Int 值的数组，或者容纳 String 值的数组，甚至容纳任何 Swift 可以创建的其他类型的数组。同样，你可以创建一个存储任何指定类型值的字典，而且类型没有限制。


//1.泛型函数
//泛型版本的函数用了一个占位符类型名（这里叫做 T ），而不是一个实际的类型名（比如 Int 、 String 或 Double ）。占位符类型名没有声明 T 必须是什么样的，但是它确实说了 a 和 b 必须都是同一个类型 T ，或者说都是 T 所表示的类型。替代 T 实际使用的类型将在每次调用 swapTwoValues(_:_:) 函数时决定。

func swapTwoValues<T>(_ a: inout T, _ b: inout T){
    let temporary = a
    a = b
    b = temporary
}

var intA = 10
var intB = 20
swapTwoValues(&intA, &intB)
print("a:\(intA) b: \(intB)")





