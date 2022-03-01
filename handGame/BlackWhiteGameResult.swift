//
//  BlackWhiteGameResult.swift
//  handGame
//
//  Created by Chu Go-Go on 2022/2/25.
//

import Foundation

enum  BlackWhiteGameResult {
//    先定義自己需要的屬性
    case chooseWay
    case win
    case lose
//    再來建立一格他們的條件
    var gameresults: String {
//        定義每個條件觸發後的動作
        switch self{
        case .chooseWay:
            return "Choose WhichWay!"
        case .lose:
            return "You Lose!"
        case .win:
            return "You Win!"
        }
    }
}
