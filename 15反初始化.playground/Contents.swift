//: Playground - noun: a place where people can play

import UIKit

//在类实例被释放的时候，反初始化器就会立即被调用。你可以是用 deinit 关键字来写反初始化器，就如同写初始化器要用 init 关键字一样。饭初始化器只在类类型中有效。

class someClss {
    //反初始化
    deinit {
        
    }
}


//1.应用反初始化器
//这里有一个应用反初始化器的栗子。这里栗子给一个简单的游戏定义了两个新的类型， Bank和 Player。 Bank类用来管理虚拟货币，它在流通过程中永远都不能拥有超过10000金币。游戏当中只能有一个 Bank，所以 Bank以具有类型属性和方法的类来实现当前状态的储存和管理：

class Bank {
    static var coinsInBank = 10_000
    static func distribute(coins numberOfCoinsRequested: Int) -> Int {
        let numberOfCoinsToVend = min(numberOfCoinsRequested, coinsInBank)
        coinsInBank -= numberOfCoinsToVend
        return numberOfCoinsToVend
    }
    
    static func receive(coins: Int) {
        coinsInBank += coins
    }
}

class Player {
    var coinsInPurse : Int
    init(coins: Int) {
        coinsInPurse = Bank.distribute(coins: coins)
    }
    
    func win(coins: Int)  {
        coinsInPurse += Bank.distribute(coins: coins)
    }
    
    deinit {
        Bank.receive(coins: coinsInPurse)
    }
}

var bank = Bank()

var playerOne: Player? = Player(coins: 100)
print("coins: \(playerOne!.coinsInPurse)")
print("bank: \(Bank.coinsInBank)")

playerOne?.win(coins: 200)
print("coins: \(playerOne!.coinsInPurse)")
print("bank: \(Bank.coinsInBank)")

playerOne = nil

print("bank: \(Bank.coinsInBank)")
