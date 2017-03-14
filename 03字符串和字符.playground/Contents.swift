//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

var emptyString = ""

if emptyString.isEmpty {
    print("字符串是空")
}

//遍历字符串
for character in "Dog!🐩".characters{
    print(character)
}


let catCharacters : [Character] = ["C", "a", "t", "!"]
let catString = String(catCharacters)

//字符串字面量中的特殊字符
let sparklingHeart = "\u{1F496}"

//字符统计
let unusualMenagerie = "Koala 🐨, Snail 🐌, Penguin 🐧, Dromedary 🐪节"
print("\(unusualMenagerie.characters.count)")

//字符串索引
//每一个 String值都有相关的索引类型， String.Index，它相当于每个 Character在字符串中的位置。
let greeting = "Guten Tag"
greeting[greeting.startIndex]
greeting[greeting.index(after: greeting.startIndex)]
greeting[greeting.index(before: greeting.endIndex)]

let index = greeting.index(greeting.startIndex, offsetBy:7)
greeting[index]

//插入与删除
var hello = "hello"
hello.insert("!", at: hello.endIndex)

hello.insert(contentsOf: " there".characters, at: hello.index(before: hello.endIndex))

//删除 返回删除了的字符
hello.remove(at: hello.index(before: hello.endIndex))
print(hello)
//删除指定一段
let range = hello.index(hello.endIndex, offsetBy: -6)..<hello.endIndex
hello.removeSubrange(range)
print(hello)

/*
 你可以在任何遵循了 RangeReplaceableIndexable 协议的类型中使用 insert(_:at:) ， insert(contentsOf:at:) ， remove(at:) 方法。这包括了这里使用的 String ，同样还有集合类型比如 Array ， Dictionary 和 Set 。
 */

//<<<<字符串比较>>>>>
//swift提供三种方法来比较文本值： 字符串和字符相等性，前缀相等性以及后缀相等性
let quotation = "aaabbb"
let sameQuotation = "aaabbb"
if quotation == sameQuotation {
    print("两个字符串一样")
}

//特定的字符串前缀或者后缀，调用字符串的 hasPrefix(_:)和 hasSuffix(_:)方法

