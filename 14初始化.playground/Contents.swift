//: Playground - noun: a place where people can play

import UIKit

//初始化是为类、结构体或者枚举准备实例的过程。这个过需要给实例里的每一个存储属性设置一个初始值并且在新实例可以使用之前执行任何其他所必须的配置或初始化。

//1.为存储属性设置初始化值
struct Fahrenheit {
//    var temoerature: Double
//    init() {
//        temoerature = 32.0
//    }
    //简写
    var temoerature = 32.0
}

var f = Fahrenheit()
print("The default temperature is \(f.temoerature) Fahrenheit")


//2.初始化形式参数
struct Celsius {
    var temperatureInCelsius: Double
    init(fromFahrenheih fahrenheit: Double) {
        temperatureInCelsius = fahrenheit
    }
    init(fromKelvin kelvin:Double) {
        temperatureInCelsius = kelvin - 273.15
    }
}

let boiling = Celsius(fromFahrenheih: 212.0)

let freezing = Celsius(fromKelvin: 273.15)

//3.形式参数名和实际参数标签
struct Color {
    let red, green, blue: Double
    init(red: Double, green: Double, blue: Double) {
        self.red = red
        self.green = green
        self.blue = blue
    }
    
    init(white: Double) {
        red = white
        green = white
        blue = white
    }
}


//4.无实际参数标签的初始化器形式参数
struct Color2 {
    let red, green, blue: Double
    init(_ white: Double) {
        red = white
        green = white
        blue = white
    }
}

let color = Color2(34)

//5.可选属性类型
//如果你的自定义类型有一个逻辑上是允许“无值”的存储属性——大概因为它的值在初始化期间不能被设置，或者因为它在稍后允许设置为“无值”——声明属性为可选类型

class SurveyQuestion {
    var text : String
    var response : String?
    init(text: String) {
        self.text = text
    }
    
    func ask(){
        print(text)
    }
    
}

let cheeseQuestion = SurveyQuestion(text: "hello world")
cheeseQuestion.ask()

print(cheeseQuestion.response ?? "是空的")

cheeseQuestion.response = "Yes"

print(cheeseQuestion.response!)


//6.默认初始化器
//Swift 为所有没有提供初始化器的结构体或类提供了一个默认的初始化器来给所有的属性提供了默认值。这个默认的初始化器只是简单地创建了一个所有属性都有默认值的新实例。
class ShoppingListItem {
    var name: String?
    var quantity = 1
    var purchased = false
}

var item = ShoppingListItem()


//7.结构体类型的成员初始化器
//如果结构体类型中没有定义任何自定义初始化器，它会自动获得一个成员初始化器。不同于默认初始化器，结构体会接收成员初始化器即使它的存储属性没有默认值。
struct Size {
    var width = 0.0 , height = 0.0
}

let size = Size(width: 2.0, height: 3.0)

print(size)

struct Point {
    var x = 0.0, y = 0.0
}

//8.值类型的初始化器委托
//初始化器可以调用其他初始化器来执行部分实例的初始化。

struct Rect {
    var origin = Point()
    var size = Size()
    init() {}
    init(origin: Point, size: Size) {
        self.origin = origin
        self.size = size
    }
    
    init(center:Point, size: Size) {
        let originX = center.x - (size.width / 2)
        let originY = center.y - (size.height / 2)
        self.init(origin: Point(x: originX, y: originY), size: size)
    }
}

let basicRect = Rect()
print(basicRect)

let originRect = Rect(origin: Point(x: 2.0, y: 2.0), size: Size(width: 10, height: 20))
print(originRect)

let centerRect = Rect(center: Point(x: 4.0, y: 4.0),
                      size: Size(width: 3.0, height: 3.0))
print(centerRect)


//9.指定初始化器和便捷初始化器
//指定初始化器是类的主要初始化器。指定的初始化器可以初始化所有那个类引用的属性并且调用合适的父类初始化器来继续这个初始化过程给父类链。


//便捷初始化器是次要的，为一个类支持初始化器。你可以在相同的类里定义一个便捷初始化器来调用一个指定的初始化器作为便捷初始化器来给指定初始化器设置默认形式参数。你也可以为具体的使用情况或输入的值类型定义一个便捷初始化器从而创建这个类的实例。

//便捷初始化器有着相同的书写方式，但是要用 convenience 修饰符放到 init 关键字前，用空格隔开：
/*
规则 1

    指定初始化器必须从它的直系父类调用指定初始化器。

规则 2

    便捷初始化器必须从相同的类里调用另一个初始化器。

规则 3

    便捷初始化器最终必须调用一个指定初始化器。
 */



//10.初始化器的继承和重写
//不像在 Objective-C 中的子类，Swift 的子类不会默认继承父类的初始化器。Swift 的这种机制防止父类的简单初始化器被一个更专用的子类继承并被用来创建一个没有完全或错误初始化的新实例的情况发生。

class Vehicle {
    var numberOfWheels = 0
    var description : String {
        return "\(numberOfWheels) wheel"
    }
}

let vehicle = Vehicle()
print(vehicle.description)

class Bicycle: Vehicle {
    override init() {
        //要初始化父类才能为父类属性赋值
        //Bicycle 类的 init() 初始化器以调用 super.init() 开始，这个方法作用是调用父类的初始化器。这样可以确保 Bicycle 在修改属性之前它所继承的属性 numberOfWheels 能被 Vehicle 类初始化。
        super.init()
        numberOfWheels = 2
    }
}


//11.自动初始化器的继承
class Food {
    var name : String
    init(name: String) {
        self.name = name
    }
    //提供了没有实际参数的便捷初始化器 init() 。 init() 初始化器通过委托调用同一类中定义的指定初始化器 init(name: String) 并给参数 name 传值 [Unnamed] 来实现提供默认的名称占位符：
    convenience init(){
        self.init(name: "[Unnamed]")
    }
}

let food = Food()
print(food.name)


class RecipeIngredient : Food {
    var quantity : Int
    init(name: String, quantity: Int) {
        self.quantity = quantity
        super.init(name: name)
    }
    override convenience init(name: String){
        self.init(name: name, quantity: 1)
    }
}

//由于它为自己引入的所有属性提供了一个默认值并且自己没有定义任何初始化器， ShoppingListItem 会自动从父类继承所有的指定和便利初始化器。
class ShoppingListItem2 : RecipeIngredient {
    var purchased = false
    var description : String {
        var output = "\(quantity) x \(name)"
        output += purchased ? "YES": "NO"
        return output
    }
}


//12.可失败的初始化器
//定义类、结构体或枚举初始化时可以失败在某些情况下会管大用。这个失败可能由以下几种方式触发，包括给初始化传入无效的形式参数值，或缺少某种外部所需的资源，又或是其他阻止初始化的情况。
struct Animal {
    let species: String
    init?(species: String) {
        if species.isEmpty {
            return nil
        }
        self.species = species
    }
}

let smoeCreature = Animal(species: "")

if let griaffe = smoeCreature {
    print("An animal was initialized with a species of \(griaffe.species)")
}else{
    print(" griaffe is nil")
}

//13.必要初始化器
//在类的初始化器前添加 required  修饰符来表明所有该类的子类都必须实现该初始化器：
class SomeClass {
    required init() {
        // initializer implementation goes here
    }
}


