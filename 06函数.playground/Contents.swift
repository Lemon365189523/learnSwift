//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//1.可以像 Swift 中其他类型那样来使用它，这使得你能够方便的将一个函数当作一个形式参数传递到另外的一个函数中，也可以在一个函数中返回另一个函数。函数同时也可以写在其他函数内部来在内嵌范围封装有用的功能。

func greet(person: String) -> String{
    
    let greeting = "hello \(person)"
    
    return greeting
}

print(greet(person: "Lemon"))

print(greet(person: "Queue"))

func greetAgain(person: String) -> String{
    return "您好" + person + "!"
}

func greet(person: String, alreadyGreeted: Bool) -> String{
    if alreadyGreeted {
        return greetAgain(person: person)
    }else{
        return greet(person: person)
    }
}

greet(person: "fwj", alreadyGreeted: true)

greet(person: "fwj", alreadyGreeted: false)

//2.多返回值函数 返回一个元组
func minMax(array: [Int]) -> (min: Int, max: Int){
    var currentMin = array[0]
    var currentMax = array[0]
    for value in array[1..<array.count] {
        if value < currentMin {
            currentMin = value;
        }else if value > currentMax{
            currentMax = value;
        }
    }
    
    return (currentMin, currentMax)
}
//数组不能为空
let bounds = minMax(array: [1,2,55,5,7,8,0])

print("min:\(bounds.min). max:\(bounds.max)")

//3.可选元组返回类型
//如果元组在函数的返回类型中有可能“没有值”，你可以用一个可选元组返回类型来说明整个元组的可能是 nil 。书法是在可选元组类型的圆括号后边添加一个问号（ ?）例如 (Int, Int)?  或者 (String, Int, Bool)? 。

//创建返回值是可选元祖的minmax函数
func canNilMinMax(array: [Int]) -> (min: Int, max: Int)?{
    if array.isEmpty {return nil}
    var currentMin = array[0]
    var currentMax = array[0]
    for value in array[1..<array.count] {
        if value < currentMin {
            currentMin = value;
        }else if value > currentMax{
            currentMax = value;
        }
    }
    return (currentMin, currentMax)
}

let nilBounds = canNilMinMax(array: [])

//可选值后要加？
print("min:\(nilBounds?.min). max:\(nilBounds?.max)")

//4.省略实际参数标签
func someFunction(_ firstName:String, secondName: String){
    print("my name is \(firstName) \(secondName)")
}

someFunction("lemon", secondName: "fan")

//5.默认形式参数值 不传参就使用默认值
func defaultParamFunction(defaultParam: Int = 12){
    print("参数为\(defaultParam)")
}

defaultParamFunction()
defaultParamFunction(defaultParam: 6)

//6.可变形式参数
//一个可变形式参数可以接受零或者多个特定类型的值。当调用函数的时候你可以利用可变形式参数来声明形式参数可以被传入值的数量是可变的。可以通过在形式参数的类型名称后边插入三个点符号（ ...）来书写可变形式参数。

func arihmeticMean(numbers:Double...) -> Double{
    var total :Double = 0;
    for number in numbers {
        total += number
    }
    return total / Double(numbers.count)
}
//求平均数
arihmeticMean(numbers: 2.2,3.3,5.5, 6.7)

//7.输入输出形式参数
//可变形式参数只能在函数的内部做改变。如果你想函数能够修改一个形式参数的值，而且你想这些改变在函数结束之后依然生效，那么就需要将形式参数定义为输入输出形式参数。 inout

//两个数调换函数
func swapTwoInts(_ a:inout Int,_ b: inout Int){
    let temporaryA = a
    a = b
    b = temporaryA
}

var a = 10, b = 20
swapTwoInts(&a, &b)
print("a:\(a)--b:\(b)")


//8.函数类型 每一个函数都有一个特定的函数类型，它由形式参数类型，返回类型组成。
func addTwoInts(_ a: Int, _ b: Int) ->Int{
    return a + b
}
//sum 的函数类型 (Int , Int) -> Int
//“定义一个叫做 sum的变量，它的类型是‘一个能接受两个 Int值的函数，并返回一个 Int值。’将这个新的变量指向 addTwoInts函数。”
var sum: (Int , Int) -> Int = addTwoInts

print("sum 10 + 20 = \(sum(10,20))")

//不同的函数如果有相同的匹配的类型的话，就可以指定相同的变量，和非函数的类型一样：
func muliplyTwoIns(_ a: Int, _ b: Int) ->Int{
    return a * b
}

sum = muliplyTwoIns

print("sum 10 * 20 = \(sum(10,20))")

//10.函数类型作为形参类型 传入函数 和 两个Int值
func printMathResult(_ mathFunction: (Int, Int)-> Int,_ a:Int,_ b: Int){
    print("Result:\(mathFunction(a, b))")
}

var resultValur = printMathResult(addTwoInts, 10, 20)
resultValur = printMathResult(muliplyTwoIns, 10, 20)

//11.函数类型作为返回类型
func setForward(_ input:Int) -> Int{
    return input + 1;
}

func setBackward(_ input: Int) -> Int{
    return input - 1
}

func chooseSetpFunction(backwards: Bool) -> (Int) -> Int{
    return backwards ? setBackward : setForward
}

let currentValue = 1
//answer是一个函数变量
let answer = chooseSetpFunction(backwards: currentValue > 2)
answer(currentValue)


//12.内嵌函数
func chooseStepFunction(backward: Bool) -> (Int) -> Int {
    func stepForward(input: Int) -> Int { return input + 1 }
    func stepBackward(input: Int) -> Int { return input - 1 }
    return backward ? stepBackward : stepForward
}








