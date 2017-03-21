//: Playground - noun: a place where people can play

import UIKit

//继承
class Vehicle {
    var currentSpeed = 0.0
    var description: String {
        return "traveling at \(currentSpeed) miles per hour"
    }
    
    func makeNoise() {
        //不做事情
    }
}

let someVehicle = Vehicle()
print(someVehicle.description)

//子类
class Bicycle: Vehicle {
    //拥有自己的属性
    var hasBasket = false
    //重写父类方法
    override func makeNoise() {
        print("Choo Choo")
    }
}

let bicycle = Bicycle()
bicycle.currentSpeed = 20
print(bicycle.description)

print(bicycle.makeNoise())


//访问父类的方法、属性和下标脚本
//你可以通过使用 super 前缀访问父类的方法、属性或下标脚本，

class Train: Vehicle {
    override func makeNoise() {
        super.makeNoise()
        print("wuwuwuwuwu~~")
    }
}

let train = Train()

train.makeNoise()

//重写属性
//你可以重写一个继承的实例或类型属性来为你自己的属性提供你自己自定义的 getter 和 setter ，或者添加属性观察器确保当底层属性值改变时来监听重写的属性。
class Car : Vehicle {
    var gear = 1
    override var description: String{
        return super.description + "in gear \(gear)"
    }
}

let car = Car()

car.currentSpeed = 25.0

car.gear = 3

print("Car: \(car.description)")

//重写属性观察器
//可以使用属性重写来为继承的属性添加属性观察器。
class AutomaticCar : Car {
    override var currentSpeed: Double{
        didSet {
            gear = Int(currentSpeed / 10.0) + 1
        }
    }
}

//阻止重写
//你可以通过标记为终点来阻止一个方法、属性或者下标脚本被重写。通过在方法、属性或者下标脚本的关键字前写 final 修饰符(比如 final var ， final func ， final class func ， fianl subscript )。

