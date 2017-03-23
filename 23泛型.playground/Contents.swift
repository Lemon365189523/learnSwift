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


//2.泛型类型
struct Stack<Element> {
    var items = [Element]()
    mutating func push(_ item: Element){
        items.append(item)
    }
    
    mutating func pop() {
        items.removeLast()
    }
}

//3.泛型扩展
extension Stack{
    var topItem : Element? {
        return items.isEmpty ? nil : items[items.count - 1]
    }
    
}
//4.类型约束
//Dictionary 需要它的键是可哈希的，以便它可以检查字典中是否包含一个特定键的值。

//语法
/*
 func someFunction<T: SomeClass, U: SomeProtocol>(someT: T, someU: U) {
 // function body goes here
 }
 */

//并非无路可走，总之，Swift 标准库中定义了一个叫做 Equatable 的协议，要求遵循其协议的类型要实现相等操作符（ == ）和不等操作符（ != ），用于比较该类型的任意两个值。所有Swift标准库中的类型自动支持 Equatable 协议。

func findIndex<T: Equatable>(of valueToFind: T, in array:[T]) -> Int? {
    for (index, value) in array.enumerated() {
        if value == valueToFind {
            return index
        }
    }
    return nil
}

let strings = ["cat", "dog", "llama", "parakeet", "terrapin"]
if let foundIndex = findIndex(of: "llama", in: strings) {
    print("The index of llama is \(foundIndex)")
}


//5.关联类型
//定义一个协议时，有时在协议定义里声明一个或多个关联类型是很有用的。关联类型给协议中用到的类型一个占位符名称。直到采纳协议时，才指定用于该关联类型的实际类型。关联类型通过 associatedtype 关键字指定。

protocol Container {
    associatedtype ItemType
    mutating func append(_ item: ItemType)
    var count: Int { get }
    subscript(i: Int) -> ItemType { get }
}

struct IntStack: Container {
    // original IntStack implementation
    var items = [Int]()
    mutating func push(_ item: Int) {
        items.append(item)
    }
    mutating func pop() -> Int {
        return items.removeLast()
    }
    // conformance to the Container protocol
    // typealias ItemType = Int 把 ItemType 抽象类型转换为了具体的 Int 类型。
    // 因为swift是类型推断的所以可以删除 typealias ItemType = Int
    typealias ItemType = Int
    mutating func append(_ item: Int) {
        self.push(item)
    }
    var count: Int {
        return items.count
    }
    subscript(i: Int) -> Int {
        return items[i]
    }
}
