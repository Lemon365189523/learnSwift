//: Playground - noun: a place where people can play

import UIKit

//属性
//属性可以将值与特定的类、结构体或者是枚举联系起来。存储属性会存储常量或变量作为实例的一部分，反之计算属性会计算（而不是存储）值。计算属性可以由类、结构体和枚举定义。存储属性只能由类和结构体定义。



/*_______1.存储属性________*/
//在其最简单的形式下，存储属性是一个作为特定类和结构体实例一部分的常量或变量。存储属性要么是变量存储属性（由 var  关键字引入）要么是常量存储属性（由 let  关键字引入）。

struct FixedLengthRange {
    var firstValue : Int
    let length: Int
}

var rang1 = FixedLengthRange(firstValue: 0, length: 3)

rang1.firstValue = 3

print(rang1.length)

//常量结构体实例的存储属性
let rang2 = FixedLengthRange(firstValue: 3, length: 3)
//不可以改变常量rang2的firstValue属性
//rang2.firstValue = 6
//这是由于结构体是值类型。当一个值类型的实例被标记为常量时，该实例的其他属性也均为常量。
print(rang2.firstValue)

//对于类来说则不同，它是引用类型。如果你给一个常量赋值引用类型实例，你仍然可以修改那个实例的变量属性。

/*______2.延迟存储属性_____*/
///延迟存储属性的初始值在其第一次使用时才进行计算。你可以通过在其声明前标注 lazy 修饰语来表示一个延迟存储属性。

class DataImporter{
    var fileName = "data.txt"
}

class DataManager {
    lazy var importer = DataImporter()
    var data = [String]()
}

let manager = DataManager()
manager.data.append("some data")

//调用才创建
print(manager.importer.fileName)

/*_______3.计算属性_______*/
//除了存储属性，类、结构体和枚举也能够定义计算属性，而它实际并不存储值。相反，他们提供一个读取器和一个可选的设置器来间接得到和设置其他的属性和值。

struct Point {
    var x = 0.0, y = 0.0
}
struct Size{
    var width = 0.0, height = 0.0
}

struct Rect {
    var origin = Point()
    var size = Size()
    var center:Point {
        get {
            let centerX = origin.x + (size.width / 2)
            let centerY = origin.y + (size.height / 2)
            return Point(x: centerX,y: centerY)
        }
        set(newCenter){
            origin.x = newCenter.x - (size.width / 2)
            origin.y = newCenter.y - (size.height / 2)
        }
    }
}

var square = Rect(origin:Point(x:0.0, y:0.0), size: Size(width: 10.0, height: 20.0))
let center = square.center
print("cneter.x=\(center.x),center.y=\(center.y)")

//--3.1只读计算属性
//一个有读取器但是没有设置器的计算属性就是所谓的只读计算属性。只读计算属性返回一个值，也可以通过点语法访问，但是不能被修改为另一个
struct Cuboid {
    var width = 0.0, height = 0.0, depth = 0.0
    //只设置只读属性
    var volume: Double {
        return width * height * depth;
    }
}

let fourByFiveByTwo = Cuboid(width: 4.0, height: 5.0, depth: 2.0)

print(fourByFiveByTwo.volume)

//3.2属性观察者
//属性观察者会观察并对属性值的变化做出回应。每当一个属性的值被设置时，属性观察者都会被调用，即使这个值与该属性当前的值相同。
//如果你实现了一个 willSet 观察者，新的属性值会以常量形式参数传递。你可以在你的 willSet 实现中为这个参数定义名字。如果你没有为它命名，那么它会使用默认的名字 newValue 。
//同样，如果你实现了一个 didSet观察者，一个包含旧属性值的常量形式参数将会被传递。你可以为它命名，也可以使用默认的形式参数名 oldValue 。

class StepCounter {
    var totalSteps: Int = 0 {
        willSet(newValue){
            print("将要被赋值\(newValue)")
        }
        didSet(oldValue){
            if totalSteps > oldValue {
                print("oldValeu:\(oldValue)小于newValue\(totalSteps)")
            }
        }
    }
}

let setpCounter = StepCounter()
setpCounter.totalSteps = 200

setpCounter.totalSteps = 400

    /*______4.类型属性语法______*/
//使用 static 关键字来标识一类型属性。对于类类型的计算类型属性，你可以使用 class 关键字来允许子类重写父类的实现。下面的栗子展示了存储和计算类型属性的语法：

struct SomeStruture {
    static var storedTypeProperty = "Some value."
    static var computedTypeProperty: Int{
        return 1
    }
}

enum SomeEnumeration {
    static var storedTypeProperty = "Some value."
    static var computedTypeProperty: Int{
        return 6
    }
}

class SomeClass {
    static var storedTypeProperty = "Some value."
    static var computedTypeProperty: Int{
        return 20
    }
    class var overrideableComputedTypeProperty: Int {
        return 107;
    }
    
}

print(SomeStruture.storedTypeProperty)

SomeStruture.storedTypeProperty = "dddddd"

print(SomeStruture.storedTypeProperty)




