//: Playground - noun: a place where people can play

import UIKit

//可选链是在可能递归为 nil 的可选项中查询和调用属性、方法和下标的过程。
//如果可选项包含值，属性、方法或者下标的调用成功；如果可选项是 nil ，属性、方法或者下标的调用会返回 nil 。多个查询可以链接在一起，如果链中任何一个节点是 nil ，那么整个链就会得体地失败。


//1.可选链代替强制展开
//你可以通过在你希望如果可选项为非 nil 就调用属性、方法或者脚本的可选值后边使用问号（ ? ）来明确可选链。这和在可选值后放叹号（ ! ）来强制展开它的值非常类似。主要的区别在于可选链会在可选项为 nil 时得体地失败，而强制展开则在可选项为 nil 时触发运行时错误。

class Person {
    var residence : Residence?
}

class Residence {
    var numberOfRooms = 1
}

let john = Person()

//强制解包 是nil的会报错 因为residence没有值展开
//let roomCount = john.residence!.numberOfRooms

//可选链
if let roomCount = john.residence?.numberOfRooms {
    print("John's residence has \(roomCount) room(s).")
}else{
     print("Unable to retrieve the number of rooms.")
}

//2.访问可选类型的下标
var testScores = ["Dave": [86, 82, 84], "Bev": [79, 94, 81]]
testScores["Dave"]?[0] = 91
testScores["Bev"]?[0] += 1
testScores["Brian"]?[0] = 72
print(testScores)

//3.链的多层连接
//你可以通过连接多个可选链来在模型中深入访问属性、方法以及下标。总之，多层可选链不会给返回的值添加多层的可选性。

/*
    if let johnsStreet = john.residence?.address?.street {
        print("John's street name is \(johnsStreet).")
    } else {
        print("Unable to retrieve the address.")
    }
*/



