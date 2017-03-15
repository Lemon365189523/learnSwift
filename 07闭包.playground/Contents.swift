//: Playground - noun: a place where people can play

import UIKit


//闭包是可以在你的代码中被传递和引用的功能性独立模块。Swift 中的闭包和 C  以及 Objective-C 中的 blocks 很像，还有其他语言中的匿名函数也类似。
/*
 在函数章节中有介绍的全局和内嵌函数，实际上是特殊的闭包。闭包符合如下三种形式中的一种：
 
 全局函数是一个有名字但不会捕获任何值的闭包；
 内嵌函数是一个有名字且能从其上层函数捕获值的闭包；
 闭包表达式是一个轻量级语法所写的可以捕获其上下文中常量或变量值的没有名字的闭包。
 
 Swift 的闭包表达式拥有简洁的风格，鼓励在常见场景中实现简洁，无累赘的语法。常见的优化包括：
 
 利用上下文推断形式参数和返回值的类型；
 单表达式的闭包可以隐式返回；
 简写实际参数名；
 尾随闭包语法。
 */

//1.闭包表达式
let names = ["Chris","Alex","Ewa","Barry","Daniella"]

func backward(_ s1: String ,_ s2:String ) -> Bool{
    return s1 > s2
}

//Swift 的标准库提供了一个叫做 sorted(by:) 的方法，会根据你提供的排序闭包将已知类型的数组的值进行排序。
var reversedName = names.sorted(by: backward)

/* 闭包表达式
 闭包表达式语法能够使用常量形式参数、变量形式参数和输入输出形式参数，但不能提供默认值。可变形式参数也能使用，但需要在形式参数列表的最后面使用。元组也可被用来作为形式参数和返回类型。
{ (parameters) -> (return type) in
    statements
}
 */

//backward(_:_:) 函数的闭包表达版本：
reversedName = names.sorted(by: {(s1: String, s2: String) -> Bool in
    return s1 > s2
})

//2.从语境中推断类型
//因排序闭包为实际参数来传递给函数，故 Swift 能推断它的形式参数类型和返回类型。 sorted(by:) 方法期望它的第二个形式参数是一个 (String, String) -> Bool 类型的函数。这意味着 (String, String)和 Bool 类型不需要被写成闭包表达式定义中的一部分，因为所有的类型都能被推断，返回箭头 ( ->) 和围绕在形式参数名周围的括号也能被省略：

reversedName = names.sorted(by: {s1,s2 in return s1 > s2})
print(reversedName)

//2.1从单表达式闭包隐式返回
//闭包可以不写return
reversedName = names.sorted(by: {s1,s2 in s1 > s2})
print(reversedName)

//2.2简写的实际参数名
//Swift 自动对行内闭包提供简写实际参数名，你也可以通过 $0 , $1 , $2 等名字来引用闭包的实际参数值。
reversedName = names.sorted(by: {$0 > $1})
print(reversedName)


//2.3运算符函数
//Swift 的 String 类型定义了关于大于号（ >）的特定字符串实现，让其作为一个有两个 String 类型形式参数的函数并返回一个 Bool 类型的值。这正好与  sorted(by:) 方法的第二个形式参数需要的函数相匹配。
reversedName = names.sorted(by: >)
print(reversedName)

///3.尾随闭包
//如果你需要将一个很长的闭包表达式作为函数最后一个实际参数传递给函数，使用尾随闭包将增强函数的可读性。
//如果闭包表达式被用作函数唯一的实际参数并且你把闭包表达式用作尾随闭包，那么调用这个函数的时候你就不需要在函数的名字后面写一对圆括号 ( )。
reversedName = names.sorted{$0 > $1}
print(reversedName)

//Swift 的 Array 类型中有一个以闭包表达式为唯一的实际参数的 map(_:) 方法。数组中每一个元素调用一次该闭包，并且返回该元素所映射的值（有可能是其他类型）。
let digitNames = [
    0: "Zero",1: "One",2: "Two",  3: "Three",4: "Four",
    5: "Five",6: "Six",7: "Seven",8: "Eight",9: "Nine"
]

let numbers = [16, 58, 510]

let strings = numbers.map { (number) -> String in
    var number = number
    var output = ""
    repeat {
        //求余数
        output = digitNames[number % 10]! + output
        number /= 10
    }while number > 0
    return output
}

print(strings)


///4.捕获值
//一个闭包能够从上下文捕获已被定义的常量和变量。即使定义这些常量和变量的原作用域已经不存在，闭包仍能够在其函数体内引用和修改这些值。
//--->1.makeIncrementer 的返回类型是 () -> Int ，意思就是比起返回一个单一的值，它返回的是一个函数。

func makeIncrementer(forIncrement amout: Int) -> () -> Int{
    var runingTotal = 0
    //incrementer() 函数是没有任何形式参数， runningTotal 和 amount 不是来自于函数体的内部，而是通过捕获主函数的 runningTotal 和 amount 把它们内嵌在自身函数内部供使用。当调用 makeIncrementer  结束时通过引用捕获来确保不会消失，并确保了在下次再次调用 incrementer 时， runningTotal 将继续增加。
    func incrementer() -> Int{
        runingTotal += amout
        return runingTotal
    }
    return incrementer
}

var makeTen = makeIncrementer(forIncrement: 10)

makeTen()
makeTen()

//注意： 如果你分配了一个闭包给类实例的属性，并且闭包通过引用该实例或者它的成员来捕获实例，你将在闭包和实例间建立一个强引用环。Swift将使用捕获列表来打破这种强引用环。


//5.闭包是引用类型
//无论你什么时候安赋值一个函数或者闭包给常量或者变量，你实际上都是将常量和变量设置为对函数和闭包的引用。
let alsoMakeTen = makeTen
alsoMakeTen()


//6.逃避闭包
//->>当闭包作为一个实际参数传递给一个函数的时候，我们就说这个闭包逃逸了，因为它可以在函数返回之后被调用。当你声明一个接受闭包作为形式参数的函数时，你可以在形式参数前写 @escaping 来明确闭包是允许逃逸的。
// 作用->>>闭包可以逃逸的一种方法是被储存在定义于函数外的变量里。比如说，很多函数接收闭包实际参数来作为启动异步任务的回调。函数在启动任务后返回，但是闭包要直到任务完成——闭包需要逃逸，以便于稍后调用。

//数组里是没参没返回值的函数
var completionHandlers: [() -> Void] = []

//接受闭包作为形式参数的函数时
func someFuntionWithEscapingClosure(comletionHandler: @escaping () -> Void){
    completionHandlers.append(comletionHandler)
}

//6.2让闭包 @escaping 意味着你必须在闭包中显式地引用 self
func someFunctionWithNonescapingClosure(closure: () -> Void){
    closure()
}

class someClass{
    var x = 10
    func doSomething() {
        //没有逃避闭包
        someFunctionWithNonescapingClosure {
            x = 200
        }
        //逃避闭包 需要用self
        someFuntionWithEscapingClosure {
            self.x = 100
        }
    }
}

let instance = someClass()
instance.doSomething()
print(instance.x)

completionHandlers.first?()
print(instance.x)


//7.自动闭包
//>>>>>自动闭包是一种自动创建的用来把作为实际参数传递给函数的表达式打包的闭包。它不接受任何实际参数，并且当它被调用时，它会返回内部打包的表达式的值。这个语法的好处在于通过写普通表达式代替显式闭包而使你省略包围函数形式参数的括号。

var customersInLine = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]

let customerProvider = {customersInLine.remove(at: 0)}
print(customersInLine.count)

print("remove:\(customerProvider())")

print(customersInLine.count)

//如果你想要自动闭包允许逃逸，就同时使用 @autoclosure 和 @escaping 标志。
//把删除的元素保存
var serveProviders: [() -> String] = []

func collectCustomerProviders(_ serveProvider: @autoclosure @escaping () -> String){
    serveProviders.append(serveProvider)
}

collectCustomerProviders(customerProvider())
print(serveProviders)
collectCustomerProviders(customerProvider())
print(serveProviders)

for item in serveProviders {
    print("serve:\(item())")
}

/*
 1:自动闭包，顾名思义是一种自动创建的闭包，用于包装函数参数的表达式，可以说是一种简便语法.
 2:自动闭包不接受任何参数，被调用时会返回被包装在其中的表达式的值。
 3:自动闭包的好处之二是让你能够延迟求值,因为代码段不会被执行直到你调用这个闭包，这样你就可以控制代码什么时候执行。
 4：含有autoclosure特性的声明同时也具有noescape的特性，及默认是非逃逸闭包，除非传递可选参数escaping.如果传递了该参数，那么将可以在闭包之外进行操作闭包,形式为：请使用@autoclosure @escaping。
 */

