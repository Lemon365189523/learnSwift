//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

print(str);

str = "dsfsdf";

print(str)

let minValue = UInt8.min

let maxValue = UInt16.max

//Double代表 64 位的浮点数。
//Float 代表 32 位的浮点数。
let double = 1.111111

//Swift 是一门类型安全的语言。类型安全的语言可以让你清楚地知道代码可以处理的值的类型。
//str = 1

let three = 3
let point = 0.14159
//整数和浮点数类型的转换必须显式地指定类型：
let pi = Double(three) + point

//类型别名 可以为已经存在的类型定义了一个新的可选名字
typealias AudioSample = UInt16
var maxAudio = AudioSample.max

let booler = false
if booler {
    print("是真的")
} else {
    print("是假的")
}

//元组把多个值合并成单一的复合型的值。元组内的值可以是任何类型，而且可以不必是同一类型。
let httpError = (404,"Not Found")
let code = httpError.0
let message = httpError.1
//可以将一个元组的内容分解成单独的常量或变量
let (statusCode, statusMessage) = httpError
print("The status code is \(statusCode)")
print("The status message is \(statusMessage)")

//定义元组的时候给其中的单个元素命名
let httpSuccess = (statusCode: 200, description: "Success")
print("The status code is \(httpSuccess.statusCode)")
print("The status message is \(httpSuccess.description)")

//>>>>>可选项<<<<<<<<
let changeStr = "Hello world"
let convertedNumber = Int(changeStr)

//声明一个可选变量 不赋值的话 值为nil
var surveyAnswer : String?
/*
 *Swift 中的 nil 和Objective-C 中的 nil 不同，在 Objective-C 中 nil 是一个指向不存在对象的指针。在 Swift中， nil 不是指针，他是值缺失的一种特殊类型，任何类型的可选项都可以设置成 nil 而不仅仅是对象类型。
 */

//>>>>>>>可选绑定<<<<<<<<
/*
 *可以使用可选项绑定来判断可选项是否包含值，如果包含就把值赋给一个临时的常量或者变量
 */

if let actulaNumber = Int(httpError.1) {
    print("可选绑定为真")
}else{
    print("可选绑定为假")
}

//隐式展开可选项
let possibleString: String? = "一串可选字符串"
let forcedString: String = possibleString!

//可以吧隐式展开可选项自动进行展开 !
let assumedString: String! = "一个自动展开可选字符串"
let implicitString = assumedString

//断言
let age = 1
assert(age >= 0,"年龄不能少于0")






