//: Playground - noun: a place where people can play

import UIKit

//错误处理
//错误处理是相应和接收来自你程序中错误条件的过程。Swift 给运行时可恢复错误的抛出、捕获、传递和操纵提供了一类支持。


//1.表示和抛出错误
//在 Swift 中，错误表示为遵循 ErrorType协议类型的值。这个空的协议明确了一个类型可以用于错误处理。
//使用 throw 语句来抛出一个错误

enum VendingMachineError : Error {
    case InvalidSelection
    case InsufficientFunds(coinsNeeded: Int)
    case OutOfStock
}

throw VendingMachineError.InsufficientFunds(coinsNeeded: 5)

//2.处理错误
//使用 do-catch 语句来处理错误，把错误作为可选项的值，或者错误不会发生的断言。每一种方法都在下边的章节中有详细叙述。

//当函数抛出一个错误，它就改变了你程序的流，所以能够快速定位错误就显得格外重要。要定位你代码中的这些位置，使用 try 关键字——或者 try? 或 try! 变体——放在调用函数、方法或者会抛出错误的初始化器代码之前。这些关键字在下面的章节中有详细的描述。

//3.使用抛出函数传递错误
//为了明确一个函数或者方法可以抛出错误，你要在它的声明当中的形式参数后边写上 throws关键字。


//4.使用 Do-Catch 处理错误
/*
 do {
 try expression
 statements
 } catch pattern 1 {
 statements
 } catch pattern 2 where condition {
 statements
 }
 */

