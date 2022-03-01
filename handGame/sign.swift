//
//  sign.swift
//  handGame
//
//  Created by Chu Go-Go on 2022/2/24.
//

import Foundation
//建立一個enum來定義剪刀石頭布
enum Sign {
    case rock
    case paper
    case scissors
    
    var emoji: String {
        switch self {
        case .rock:
            return "👊🏿"
        case .paper:
            return "✋🏿"
        case .scissors:
            return "✌🏿"
        }
    }
 
//    建立一個func帶入隨機的的sign，最後再把結果回傳到GameResult
    func game(robotSign: Sign) -> GameResult {
//        如果輸入的跟機器人的一樣就會回傳平手
        if self == robotSign{
            return .draw
        }
//        直接編輯獲勝的方式，不符合的就等於輸
        switch self {
        case .rock:
            if robotSign == .scissors {
                return .win
            }
        case .paper:
            if robotSign == .rock {
                return .win
            }
        case .scissors:
            if robotSign == .paper {
                return .win
            }
        }
//        不符合上面條件的就會return .lose有點像default
        return .lose
    }
}
//建立一個隨機亂數出拳enum GameResult
func robotRandomSign() -> Sign{
    let radomSign = Int.random(in: 0...2)
    if radomSign == 0{
        return .paper
    }else if radomSign == 1{
        return .rock
    }else {
        return .scissors
    }
}
