//: Playground - noun: a place where people can play

import UIKit

/*-_______1.实例方法_________*/
//实例方法 是属于特定类实例、结构体实例或者枚举实例的函数。他们为这些实例提供功能性，要么通过提供访问和修改实例属性的方法，要么通过提供与实例目的相关的功能。
class Counter{
    var count = 0
    func increment(){
        count += 1
    }
    func increment(by amout:Int ){
        count += amout
    }
    func reset(){
        count = 0
    }
}


var counter = Counter()
counter.increment()
print(counter.count)
counter.increment(by: 10)
print(counter.count)
counter.reset()
print(counter.count)

/*__________2.self属性_____*/
//每一个类的实例都隐含一个叫做 self的属性，它完完全全与实例本身相等。你可以使用 self属性来在当前实例当中调用它自身的方法。实际上，你不需要经常在代码中写 self。如果你没有显式地写出 self，Swift会在你于方法中使用已知属性或者方法的时候假定你是调用了当前实例中的属性或者方法。
struct Point{
    var x = 0.0 ,y = 0.0
    func isToTheRightOf(x:Double) -> Bool {
        //self就避免了叫做 x 的方法形式参数还是同样叫做 x 的实例属性这样的歧义
        return self.x > x
    }
}


let somPoint = Point(x:4.0, y: 5.0)
if somPoint.isToTheRightOf(x: 1.0) {
    print("x在点左边")
}

/*_____3.在实例方法中修改值类型______*/
//结构体和枚举是值类型。默认情况下，值类型属性不能被自身的实例方法修改。
//果你需要在特定的方法中修改结构体或者枚举的属性，你可以选择将这个方法异变。然后这个方法就可以在方法中异变（嗯，改变）它的属性了，并且任何改变在方法结束的时候都会写入到原始的结构体中。
struct Point2 {
    var x = 0.0, y = 0.0
    //  被添加到定义中的 mutating关键字允许它修改自身的属性。
    mutating func moveBy(x deltaX: Double,y DeltaY:Double){
        self = Point2(x: x + deltaX, y: y + DeltaY)
    }
}

var fixedPoint = Point2(x: 3.0, y: 3.0)
fixedPoint.moveBy(x: 2.0, y: 3.0)

//开关控制方法
enum TriStateSwitch {
    case off, low, high
    mutating func next() {
        switch self {
        case .off:
            self = .low
        case .low:
            self = .high
        case .high:
            self = .off
        }
    }
}
var ovenLight = TriStateSwitch.low
ovenLight.next()
// ovenLight is now equal to .high
ovenLight.next()
// ovenLight is now equal to .off

/*_____4.类方法______*/

var a = 0;
class SomeClass {
    class func someTypeMethod() {
        // type method implementation goes here
        a = 10
    }
}
SomeClass.someTypeMethod()

print(a)




