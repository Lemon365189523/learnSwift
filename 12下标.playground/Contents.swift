//: Playground - noun: a place where people can play

import UIKit

//使用关键字 subscript 来定义下标，并且指定一个或多个输入形式参数和返回类型，与实例方法一样。
struct TimesTable{
    let multiplier: Int
    subscript(index: Int) -> Int {
        return multiplier * index
    }
}

let timesTable = TimesTable(multiplier: 3)
print(timesTable[6])


//下标选项
//下标可以接收任意数量的输入形式参数，并且这些输入形式参数可以是任意类型。下标也可以返回任意类型。下标可以使用变量形式参数和可变形式参数，但是不能使用输入输出形式参数或提供默认形式参数值。

struct Matrix {
    let rows: Int, columns: Int
    var grid: [Double]
    init(rows: Int, columns: Int) {
        self.rows = rows
        self.columns = columns
        grid = Array(repeating: 0.0, count: rows * columns)
    }
    
    func indexIsValidForRow(row: Int, column: Int) -> Bool {
        return row >= 0 && row < rows && column >= 0 && column < columns
    }
    
    subscript(row: Int, column: Int) -> Double {
        get {
            assert(indexIsValidForRow(row: row, column: column),"Index out of range")
            return grid[(row * columns) + column]
        }
        set {
            assert(indexIsValidForRow(row: row, column: column), "Index out of range")
            grid[(row * columns) + column] = newValue
        }
    }
}

var matrix = Matrix(rows: 2, columns: 2)

matrix[0, 1] = 1.5

matrix[0, 0] = 2.5

matrix[1, 1] = 3.5
//超出区域抛异常
//matrix[2, 2] = 9


print(matrix.grid)

