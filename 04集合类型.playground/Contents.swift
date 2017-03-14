//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//Swift 提供了三种主要的集合类型，所谓的数组、合集还有字典，用来储存值的集合。数组是有序的值的集合。合集是唯一值的无序集合。字典是无序的键值对集合。

//创建一个空数组
var someInts = [Int]()

someInts.append(3)
someInts.append(4)
someInts.append(3)

someInts = []
someInts.append(1)

//使用重复默认值创建数组
var threeDoubles = Array(repeating:2, count: 3)

//链接两个数组 返回一个新数组 要使用同一类型 元组用() 数组[]
var newArray = someInts + threeDoubles

if newArray.isEmpty {
    print("数组为空")
}else{
    print("数组不为空")
}

//可以使用+=在数组末尾添加一个或多个相同类型元素
newArray += [3]
newArray += [13,14]

//使用索引改变值
newArray[2] = 100
print(newArray)

//插入
newArray.insert(22, at: 3)

for item in newArray {
    print(item)
}

//enumerated()方法返回数组中每一个元素的元组，包含了这个元素的索引和值
for (index, value) in newArray.enumerated(){
    print("Item\(index):\(value)")
}

//<<<<>> 集合Set <<<>><><><>
var letters = Set<Character>()
print("letters is of type Set<Character> with \(letters.count) items")

letters.insert("a")

//可以使用数组字面量来初始化一个合集，算是一种写一个或者多个合集值的快捷方式
var numberSet: Set<String> = ["one","two","three"]

numberSet.insert("four")

if numberSet.contains("one") {
    print("包含one")
} else {
    print("不包含one")
}

//遍历集合 使用循序排序  集合的元素使用<运算符排序返回
for num in numberSet.sorted(){
    print(num)
}

var numberSet2 = Set<String>(arrayLiteral: "five","six","four")

//交集
numberSet.intersection(numberSet2)

//反交集
numberSet.symmetricDifference(numberSet2)

//并集
numberSet.union(numberSet2)

//补集 创建一个两个合集当中不包含某个合集值的新合集。
numberSet.subtracting(numberSet2)


//>>>>>>>字典<<<<<<<<<<
//Dictionary<Key, Value>  可以简写为： [Key: Value]

var nameOfIntergers = [Int: String]()

nameOfIntergers[16] = "lemon"

nameOfIntergers[20] = "queen"

print(nameOfIntergers)

var dic2 = [1: "one",2 :"two",3 :"three"]

//更新元素 有对应得key 更新成功返回旧值 没有的话返回一个nil （返回一个可选值）
if let oldValue = dic2.updateValue("four", forKey: 4) {
    print("跟新成功")
}

let allkeys = [Int](nameOfIntergers.keys)

let allValues = [String](nameOfIntergers.values)











