//
//  GameResult.swift
//  handGame
//
//  Created by Chu Go-Go on 2022/2/24.
//

import Foundation

enum GameResult {
//    先定義自己需要的屬性
    case start
    case win
    case lose
    case draw
//    再來建立一格他們的條件
    var results: String {
//        定義每個條件觸發後的動作
        switch self{
        case .start:
            return "Rock, Paper, Scissors?"
        case .lose:
            return "You Lose!"
        case .win:
            return "You Win!"
        case .draw:
            return "Draw! Play Again!"
        }
    }
//    var playerWin: Bool{
//        switch self {
//        case .start:
//            return false
//        case .win:
//            return true
//        case .lose:
//            return false
//        case .draw:
//            return false
//        }
//    }
//    var robotWin: Bool{
//        switch self {
//        case .start:
//            return false
//        case .win:
//            return true
//        case .lose:
//            return false
//        case .draw:
//            return false
//        }
//    }
    
}
