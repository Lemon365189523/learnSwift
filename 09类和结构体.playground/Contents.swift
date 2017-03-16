//: Playground - noun: a place where people can play

import UIKit

//类和结构体

/*
 1.----------类与结构体的对比------------------
 在 Swift 中类和结构体有很多共同之处，它们都能：
 
 定义属性用来存储值；
 定义方法用于提供功能；
 定义下标脚本用来允许使用下标语法访问值；
 定义初始化器用于初始化状态；
 可以被扩展来默认所没有的功能；
 遵循协议来针对特定类型提供标准功能
 */

/*
 类有而结构体没有的额外功能：
 
 继承允许一个类继承另一个类的特征;
 类型转换允许你在运行检查和解释一个类实例的类型；
 反初始化器允许一个类实例释放任何其所被分配的资源；
 引用计数允许不止一个对类实例的引用。
 */

//2.--------定义语法------------
struct Resolution {
    var width = 0
    var height = 0
}

class VideoMode{
    var resolution = Resolution()
    var interlaced = false
    var frameRate = 0.0
    var name: String?
}

//所有的结构体都有一个自动生成的成员初始化器，你可以使用它来初始化新结构体实例的成员属性
let vga = Resolution(width:640, height: 480)


//3.------结构体和枚举是值类型-----
//值类型是一种当它被指定到常量或者变量，或者被传递给函数时会被拷贝的类型。和实例作为属性所包含的任意值类型——在代码传递中总是被拷贝的。
let hd = Resolution(width: 1920, height: 1080)
var cinema = hd
cinema.width = 2048
print(hd)


//4.------类是引用类型----------
//变量或者本身被传递到一个函数的时候它是不会被拷贝的。相对于拷贝，这里使用的是同一个对现存实例的引用。
let tenEighty = VideoMode()
tenEighty.resolution = hd
tenEighty.interlaced = true
tenEighty.name = "1080i"
tenEighty.frameRate = 26.0

let test = tenEighty
test.frameRate = 30.0

print(tenEighty.frameRate)


//5.-------特征运算符-------
//相同于 ( ===)
//不相同于( !==)

if tenEighty === test {
    print("两个对象是一样的")
}


//6.类和结构体之间的选择
/*
 6.1:按照通用准则，当符合以下一条或多条情形时应考虑创建一个结构体：
 
 结构体的主要目的是为了封装一些相关的简单数据值；
 当你在赋予或者传递结构实例时，有理由需要封装的数据值被拷贝而不是引用；
 任何存储在结构体中的属性是值类型，也将被拷贝而不是被引用；
 结构体不需要从一个已存在类型继承属性或者行为。
 
 
 6.2:合适的结构体候选者包括：
 
 几何形状的大小，可能封装了一个 width属性和 height属性，两者都为 double类型；
 一定范围的路径，可能封装了一个 start属性和 length属性，两者为 Int类型；
 三维坐标系的一个点，可能封装了 x , y 和 z属性，他们都是 double类型。
 
 */






