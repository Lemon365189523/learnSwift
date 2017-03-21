//: Playground - noun: a place where people can play

import UIKit

//扩展为现有的类、结构体、枚举类型、或协议添加了新功能。这也包括了为无访问权限的源代码扩展类型的能力（即所谓的逆向建模）。扩展和 Objective-C 中的分类类似。（与 Objective-C 的分类不同的是，Swift 的扩展没有名字。）

/*
 Swift 中的扩展可以：
 
 添加计算实例属性和计算类型属性；
 定义实例方法和类型方法；
 提供新初始化器；
 定义下标；
 定义和使用新内嵌类型；
 使现有的类型遵循某协议
 */


//1.扩展的语法
//扩展可以使已有的类型遵循一个或多个协议。在这种情况下，协议名的书写方式与类或结构体完全一样：
/*
    extension SomeType{
    
    }
    
    extension SomeTye: SomeProtocol, AnotherProtocol{
 
    }
 */

//2.计算属性
extension Double {
    var km: Double {
        return self * 1_000.0
    }
    var m : Double {
        return self
    }
    var cm : Double{
        return self / 100.0
    }
    
}


let oneInch = 20.5.cm

print("onInch is \(oneInch) meters")


//3.初始化器
extension Int {
    init(index: Int) {
        self = index * index
    }
}

var index = Int(index:20)
print(index)


//4.方法
extension Int {
    
    func repetitions(task: (Int) -> Void) {
        for index in 0..<self {
            task(index)
        }
    }
}

3.repetitions { (index) in
    print(index)
}

//5.异变实例方法
//增加了扩展的实例方法仍可以修改（或异变）实例本身。结构体和枚举类型方法在修改 self 或本身的属性时必须标记实例方法为 mutating ，和原本实现的异变方法一样。
extension Int {
    mutating func square() {
        self = self * self
    }
}
var someInt = 3
someInt.square()


//6.下标
extension Int {
    subscript(digitIndex: Int) -> Int {
        var decimalBase = 1
        for _ in 0..<digitIndex {
            decimalBase *= 10
        }
        return (self / decimalBase) % 10
    }
}

746381295[2]


