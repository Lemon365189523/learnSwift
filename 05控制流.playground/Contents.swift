//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//for in

//while循环
var a = 0
while a < 5 {
    a += 1
    print(a)
}

let finalSquare = 25
var board = [Int](repeating: 0, count: finalSquare + 1)

board[03] = +08; board[06] = +11; board[09] = +09; board[10] = +02
board[14] = -10; board[19] = -11; board[22] = -02; board[24] = -08

var player = 0
var diceRoll = 0
while player < finalSquare {
    diceRoll += 1
    if diceRoll == 7 {
        diceRoll = 1
    }
    
    player += diceRoll
    if player < board.count {
        player += board[player]
    }
}


//repeat-while 循环，在判断循环条件之前会执行一次循环代码块。

//整个 switch 语句会在匹配到第一个 switch 情况执行完毕之后退出，不再需要显式的 break 语句。
let someChar: Character = "a"
switch someChar {
case "a","A":
    //多个值可以用逗号分隔
    print("someChar is a or A")
default:
    print("no a or A ")
}

//区间匹配
let count = 62
var naturalCount : String
switch count {
case 0:
    naturalCount = "0 "
case 1..<20:
    naturalCount = "1~ 19"
case 20..<50:
    naturalCount = "20~49"
case 50..<80:
    naturalCount = "50~79"
case 80...100:
    naturalCount = "80~100"
default:
    naturalCount = "100+"
}

//元祖匹配
let point = (1,1)
switch point {
case (0, 0):
    print("(0, 0) is at the origin")
case (_, 0):
    print("(\(point.0), 0) is on the x-axis")
case (0, _):
    print("(0, \(point.1)) is on the y-axis")
case (-2...2, -2...2):
    print("(\(point.0), \(point.1)) is inside the box")
default:
    print("(\(point.0), \(point.1)) is outside of the box")
}

//复合匹配 所有复合情况的模式都必须包含相同的值绑定集合，并且复合情况中的每一个绑定都得有相同的类型格式。
let anotherPoint = (9,0)
switch anotherPoint {
case (let distance, 0), (0, let distance):
    print(distance)
default:
    print("no");
}

//<<<<<> 控制转移语句 ><><><><><
//continue break 

//Fallthrough 贯穿 fallthrough 关键字不会为switch情况检查贯穿入情况的条件。 fallthrough 关键字只是使代码执行直接移动到下一个情况（或者 default 情况）的代码块中，就像C的标准 switch 语句行为一样。
let integerToDescribe = 5
var description = "The number \(integerToDescribe) is"
switch integerToDescribe {
case 2, 3, 5, 7, 11, 13, 17, 19:
    description += " a prime number, and also"
    fallthrough
default:
    description += " an integer."
}
print(description)


//给语句打标签
/*在一个条件语句中，你可以使用一个语句标签配合 break 语句来结束被标记的语句。在循环语句中，你可以使用语句标签来配合 break 或者 continue 语句来结束或者继续执行被标记的语句。*/


//提前退出
func greet(person :[String: String]){
    guard let name = person["name"] else {
        return
    }
    
    print("Hello \(name)")
    
    guard let location = person["location"] else {
        print("没有地址");
        return;
    }
    
    print(" 地址\(location)")
    
}

greet(person: ["name":"lemon"])


if #available(iOS 10, *) {
    print("ios 10")
}


