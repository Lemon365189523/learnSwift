//: Playground - noun: a place where people can play

import UIKit

//、、协议为方法、属性、以及其他特定的任务需求或功能定义蓝图。协议可被类、结构体、或枚举类型采纳以提供所需功能的具体实现。满足了协议中需求的任意类型都叫做遵循了该协议。


//1.属性要求
//协议可以要求所有遵循该协议的类型提供特定名字和类型的实例属性或类型属性。
//属性要求定义为变量属性，在名称前面使用 var 关键字。可读写的属性使用 { get set } 来写在声明后面来明确，使用 { get } 来明确可读的属性。

protocol SomeProtocol {
    var mustBeSettable : Int {get set}
    var doesNotNeedToBeSettable : Int {get}
}

//在协议中定义类型属性时在前面添加 static 关键字。当类的实现使用 class 或 static 关键字前缀声明类型属性要求时

protocol AnotherProtocol {
    static var someTypeProperty : Int {get set}
}


protocol FullyName {
    var fullName: String { get }
}

struct Person : FullyName {
    var fullName: String
}

let john = Person(fullName: "John")

class Starship : FullyName {
    var prefix: String?
    var name : String
    init(name: String, prefix: String? = nil) {
        self.name = name
        self.prefix = prefix
    }
    
    var fullName: String{
        return (prefix != nil ? prefix! + " " : "") + name
    }
}


let starship = Starship(name: "ddd", prefix: "dfdf")
print(starship.fullName)

//2.方法要求
//协议可以要求采纳的类型实现指定的实例方法和类方法。这些方法作为协议定义的一部分，书写方式与正常实例和类方法的方式完全相同，但是不需要大括号和方法的主体。当协议中定义类型方法时，你总要在其之前添加 static 关键字。

protocol StaricProtocol {
    static func staticMethod()
    static func random() -> Double
}

class SomeClass : StaricProtocol{
    static func staticMethod() {
        print("static 方法")
    }
    static func random() -> Double {
        return 100 / 3.0
    }
}

SomeClass.staticMethod()
SomeClass.random()

//3.异变方法要求
//func 关键字之前使用 mutating 关键字，来表示在该方法可以改变其所属的实例
protocol Togglable{
    mutating func toggle()
}

enum OnOffSwith : Togglable {
    case Off, On
    mutating func toggle() {
        switch self {
        case .Off:
            self = .On
        case .On:
            self = .Off
        }
    }
}

var lightSwitch = OnOffSwith.Off
lightSwitch.toggle()
lightSwitch.toggle()


//4.初始化器要求
//协议可以要求遵循协议的类型实现指定的初始化器。
protocol InitProtocol {
    init(parameter: Int)
}

class IntClass : InitProtocol{
    var sum : Int
    //在遵循协议的类的所有子类中， required 修饰的使用保证了你为协议初始化器要求提供了一个明确的继承实现。
    required init(parameter: Int) {
        sum = parameter
    }
}


//5.将协议作为类型
//实际上协议自身并不实现功能。不过你创建的任意协议都可以变为一个功能完备的类型在代码中使用。

class Dice {
    let sides: Int
    //传入遵守FullyName协议的实例
    let fullName : FullyName
    init(sides: Int, fullName: FullyName) {
        self.sides = sides
        self.fullName = fullName
    }
    
    func showString() -> String {
        return "\(fullName.fullName) : Int \(sides)"
    }
}

var dd = Dice(sides: 2, fullName: Starship(name:"lemon", prefix: "fan"))

print(dd.showString())


//6.委托
///委托[1]是一个允许类或者结构体放手（或者说委托）它们自身的某些责任给另外类型实例的设计模式,这个设计模式通过定义一个封装了委托责任的协议来实现
//委托可以用来响应一个特定的行为，或者从外部资源取回数据而不需要了解资源具体的类型。

protocol DiceGame {
    var dice: Dice {get}
    func play()
}

protocol DiceGameDelegate {
    func gameDidStart(_ game: DiceGame)
    func game(_ game: DiceGame, didStartNewTurnWithDiceRoll diceRoll: Int)
    func gameDidEnd(_ game: DiceGame)
}

//DiceGame 协议是一个给任何与骰子有关的游戏采纳的协议。 DiceGameDelegate 协议可以被任何追踪 DiceGame 进度的类型采纳。


//7.使用扩展声明采纳协议
protocol TextRepresentable {
    
}
struct Hamster {
    var name: String
    var textualDescription: String {
        return "A hamster named \(name)"
    }
}
extension Hamster: TextRepresentable {}



let simonTheHamster = Hamster(name: "Simon")
print(simonTheHamster.textualDescription)
let somethingTextRepresentable: TextRepresentable = simonTheHamster
print(somethingTextRepresentable)

//8.协议继承

//协议可以继承一个或者多个其他协议并且可以在它继承的基础之上添加更多要求。协议继承的语法与类继承的语法相似，只不过可以选择列出多个继承的协议，使用逗号分隔：
protocol InheritingProtocol: SomeProtocol, AnotherProtocol {
    // protocol definition goes here
}


//9.类专用的协议
//通过添加 class 关键字到协议的继承列表，你就可以限制协议只能被类类型采纳（并且不是结构体或者枚举）。 class 关键字必须出现在协议继承列表的最前边，在任何继承的协议之前：


protocol SomeClassOnlyProtocol: class, AnotherProtocol {
    // class-only protocol definition goes here
}

//10.协议组合
//要求一个类型一次遵循多个协议是很有用的。你可以使用协议组合来复合多个协议到一个要求里。协议组合使用 SomeProtocol & AnotherProtocol 的格式。

//你可以使用类型转换中描述的 is 和 as 运算符来检查协议遵循，还能转换为特定的协议。检查和转换协议的语法与检查和转换类型是完全一样的：
/*
if let objectWithArea = object as? HasArea {
    print("Area is \(objectWithArea.area)")
} else {
    print("Something that doesn't have an area")
}
*/

//11.可选协议要求
//你可以给协议定义可选要求，这些要求不需要强制遵循协议的类型实现。可选要求使用 optional 修饰符作为前缀放在协议的定义中。
//可选要求允许你的代码与 Objective-C 操作。协议和可选要求必须使用 @objc 标志标记。


//12.协议扩展
//协议可以通过扩展来提供方法和属性的实现以遵循类型。这就允许你在协议自身定义行为，而不是在每一个遵循或者在全局函数里定义
extension AnotherProtocol {
    var ddd : String {
        return "ssss"
    }
}

//13.协议提供默认实现
//你可以使用协议扩展来给协议的任意方法或者计算属性要求提供默认实现。如果遵循类型给这个协议的要求提供了它自己的实现，那么它就会替代扩展中提供的默认实现。

extension FullyName{
    var fullName: String {
        return "mimi"
    }
}


//14.给协议扩展添加限制
//当你定义一个协议扩展，你可以明确遵循类型必须在扩展的方法和属性可用之前满足的限制。在扩展协议名字后边使用 where 分句来写这些限制


