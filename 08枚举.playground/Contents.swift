//: Playground - noun: a place where people can play

import UIKit

//枚举成员可以指定任意类型的值来与不同的成员值关联储存
//Swift 中的枚举是具有自己权限的一类类型。它们使用了许多一般只被类所支持的特性，例如计算属性用来提供关于枚举当前值的额外信息，并且实例方法用来提供与枚举表示的值相关的功能。枚举同样也能够定义初始化器来初始化成员值

//------1.枚举语法
enum CompassPoint {
    //case关键字则明确了要定义成员值。
    case north
    case south
    case east
    case west
}

//不像 C 和 Objective-C 那样，Swift 的枚举成员在被创建时不会分配一个默认的整数值。在上文的 CompassPoint例子中， north， south， east和 west并不代表 0， 1， 2和 3。而相反，不同的枚举成员在它们自己的权限中都是完全合格的值，并且是一个在 CompassPoint中被显式定义的类型。

var directionToHead = CompassPoint.north

//当与 CompassPoint中可用的某一值一同初始化时 directionToHead的类型会被推断出来。一旦 directionToHead以 CompassPoint类型被声明，你就可以用一个点语法把它设定成不同的 CompassPoint值：
directionToHead = .east

switch directionToHead {
case .north:
    print(directionToHead)
case .south:
    print(directionToHead)
case .east:
    print(directionToHead)
case .west:
    print(directionToHead)
}

//---------2.关联值
//      你可以定义 Swift 枚举来存储任意给定类型的关联值，如果需要的话不同枚举成员关联值的类型可以不同。
enum Barcode {
    case upc(Int, Int, Int, Int)
    case qrCode(String)
}

var productBarcode = Barcode.upc(8, 8777, 8121, 3)
//这时，最初的 Barcode.upc和它的整数值将被新的 Barcode.qrCode和它的字符串值代替。
productBarcode = .qrCode("LEMONPRODUCT")

print(productBarcode)

//---------3.原始值（枚举成员可以用相同类型的默认值预先填充（称为原始值）。）
//ASCIIControlCharacter的枚举原始值被定义为类型 Character
enum ASCIIControlCharacter: Character {
    case tab = "\t"
    case lineFeed = "\n"
    case carriageReturn = "\r"
}

var char = ASCIIControlCharacter.carriageReturn

//rawValue显示原始值 要定义类型才有
let str = char.rawValue

//如果你用原始值类型来定义一个枚举，那么枚举就会自动收到一个可以接受原始值类型的值的初始化器（叫做 rawValue的形式参数）然后返回一个枚举成员或者 nil 。你可以使用这个初始化器来尝试创建一个枚举的新实例。
let test = ASCIIControlCharacter(rawValue: "\t")

enum Planet: Int {
    case mercury = 1, venus, earth, mars, jupiter, saturn, uranus, neptune
}

let positionToFind = 11
if let somePlant = Planet(rawValue: positionToFind) {
    
}else{
    print("There isn't a planet at position \(positionToFind)")
}

//-------4.递归枚举
//递归枚举是拥有另一个枚举作为枚举成员关联值的枚举。当编译器操作递归枚举时必须插入间接寻址层。你可以在声明枚举成员之前使用 indirect关键字来明确它是递归的。
enum ArithmeticExpression{
    case number(Int)
    indirect case addition(ArithmeticExpression, ArithmeticExpression)
    indirect case multiplication(ArithmeticExpression, ArithmeticExpression)
}

//你同样可以在枚举之前写 indirect 来让整个枚举成员在需要时可以递归：
/*
indirect enum ArithmeticExpression {
    case number(Int)
    case addition(ArithmeticExpression, ArithmeticExpression)
    case multiplication(ArithmeticExpression, ArithmeticExpression)
}
 */
// (5 + 4) * 2 乘号右侧有一个数字左侧有其他表达式。
let five = ArithmeticExpression.number(5)
let four = ArithmeticExpression.number(4)
let sum = ArithmeticExpression.addition(five, four)
let product = ArithmeticExpression.multiplication(sum, ArithmeticExpression.number(2))

//递归函数是一种操作递归结构数据的简单方法。比如说，这里有一个判断数学表达式的函数：
func evaluate(_ expression: ArithmeticExpression) -> Int {
    switch expression {
    case let .number(value):
        return value
    case let .addition(left, right):
        return evaluate(left) + evaluate(right)
    case let .multiplication(left, right):
        return evaluate(left) * evaluate(right)
    }
}

print(evaluate(product))
