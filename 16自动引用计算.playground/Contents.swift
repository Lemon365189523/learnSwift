//: Playground - noun: a place where people can play

import UIKit


//为了确保使用中的实例不会消失，ARC 会跟踪和计算当前实例被多少属性，常量和变量所引用。只要存在对该类实例的引用，ARC 将不会释放该实例。

class Person {
    let name : String
    init(name: String) {
        self.name = name
        print("\(name) is being initialized")
    }
    deinit {
        print("\(name) is being deinitialized")
    }
}

var person1 : Person?
var person2 : Person?
var person3 : Person?

person1 = Person(name:"John")

person2 = person1

person3 = person1

person1 = nil

person2 = nil
//最后一个引用释放 对象才被释放
person3 = nil


//2.类实例之间的循环强引用
class Person2{
    let name : String
    init(name:String) {
        self.name = name
    }
    var apartment : Apartment?
    deinit {
        print("\(name) is being deinitialized")
    }
    
}

//解决循环强引用问题，可以通过定义类之间的关系为弱引用( weak )或无主引用( unowned )来代替强引用。
class Apartment {
    let unit: String
    init(unit: String) { self.unit = unit }
    weak var tenant: Person2?
    deinit { print("Apartment \(unit) is being deinitialized") }
}

var john : Person2?
var unit4A : Apartment?

john = Person2(name: "John Appleseed")
unit4A = Apartment(unit: "4A")
//相互引用
john!.apartment = unit4A
unit4A!.tenant = john


john = nil
unit4A = nil

/*
 无主引用
 
 和弱引用类似，无主引用不会牢牢保持住引用的实例。但是不像弱引用，总之，无主引用假定是永远有值的。因此，无主引用总是被定义为非可选类型。你可以在声明属性或者变量时，在前面加上关键字 unowned 表示这是一个无主引用。
 
 
 注意：无主引用总是被定义为非可选类型
 */

//3.闭包的循环强引用
/*
 循环强引用还会出现在你把一个闭包分配给类实例属性的时候，并且这个闭包中又捕获了这个实例。捕获可能发生于这个闭包函数体中访问了实例的某个属性，比如 self.someProperty ，或者这个闭包调用了一个实例的方法，例如 self.someMethod() 。这两种情况都导致了闭包 “捕获”了  self ，从而产生了循环强引用。
 */

class HTMLElement {
    
    let name: String
    let text: String?
    //self的闭包里持有了self
    lazy var asHTML: () -> String = {
        [unowned self] in
        if let text = self.text {
            return "<\(self.name)>\(text)</\(self.name)>"
        } else {
            return "<\(self.name) />"
        }
    }
    
    init(name: String, text: String? = nil) {
        self.name = name
        self.text = text
    }
    
    deinit {
        print("\(name) is being deinitialized")
    }
    
}
var heading : HTMLElement?
heading = HTMLElement(name: "h1")
print(heading!.asHTML())
heading = nil




