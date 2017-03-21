//: Playground - noun: a place where people can play

import UIKit

//枚举通常用于实现特定类或结构体的功能。类似的，它也可以在更加复杂的类型环境中方便的定义通用类和结构体。为实现这种功能，Swift 允许你定义内嵌类型，借此在支持类型的定义中嵌套枚举、类、或结构体。

struct BlackjackCard {
    enum  Suit: Character{
         case Spades = "♠︎", Hearts = "♡", Diamonds = "♢", Clubs = "♣︎"
    }
    
    enum Rank : Int {
        case Two = 2, Three, Four, Five, Six, Seven, Eight, Nine, Ten
        case Jack, Queen, King, Ace
        struct Values {
            let first : Int, second: Int?
        }
        var  values: Values{
            switch self {
            case .Ace:
                return Values(first: 1, second: 11)
            case .Jack, .Queen ,.King:
                    return Values(first:10, second: nil)
            default:
                return Values(first:self.rawValue, second: nil)
            }
        }
    }
    
    //
    let rank: Rank, suit: Suit
    var description : String{
        var output = "suit is \(suit.rawValue),"
        output += " value is \(rank.values.first)"
        if let second = rank.values.second {
            output += " or \(second)"
        }
        return output
    }

}


let spadesAce = BlackjackCard(rank: .Ace, suit: .Spades)

print(spadesAce.description)

let diamondsKing = BlackjackCard(rank: .King, suit: .Diamonds)

print(diamondsKing.description)


