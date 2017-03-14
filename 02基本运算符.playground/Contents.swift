//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

let (x, y) = (1 , 2)

print("x:\(x),y:\(y)")

//Swift 算术运算符默认不允许值溢出 溢出操作符
//Int16 整数能容纳的有符号整数范围是 -32768 到 32767 ，当为一个 Int16 型变量赋的值超过这个范围时，系统就会报错：
var z : UInt8  = 255;
z = z &+ 3

var c = 9 % 4

c = 9 % -4

//元祖比较 先比较第一个元素  再比较第二个
if (1, "apple") < (1, "bird"){
    print("元祖（1,app;e）小于 （1，bird）")
}

let height = 10 + (false ? 60: 70)

//合并空值运算符号 a??b 意思是 a != nil ? a! : b

let defaultColorName = "red"
var userDefinedColorName: String? = "bule"
//第一个值不为空就用第一个的值  空的就用后面的值
var colorNameToUse = userDefinedColorName ?? defaultColorName

//区间运算符
for index in 1...5 {
    print("区间1...5 + \(index)")
}

for index in 1..<5{
    print("半开区间1..<5 + \(index)")
}




