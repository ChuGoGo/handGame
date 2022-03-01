//
//  blackWhiteGuess.swift
//  handGame
//
//  Created by Chu Go-Go on 2022/2/25.
//

import Foundation
import UIKit
//定義上下左右
enum BlackWhiteGuess {
    case up
    case down
    case left
    case right
//    要回傳的圖片
    var wayImage:String {
        switch self {
        case .up:
            return "up"
        case .down:
            return "down"
        case .left:
            return "left"
        case .right:
            return "right"
        }
    }
//把選擇的方向跟電腦的方向做比對之後再回傳到結果裡面
    func guessGame(robotway: BlackWhiteGuess) -> BlackWhiteGameResult {
//        如果比對了就猜中就等於贏
        if self == robotway{
            return .win
        }
//        如果沒猜中就是輸了
        return .lose
    }
}
//用亂數跑出電腦顯示的圖片
func robotRodomGuess()-> BlackWhiteGuess{
    let randomIV = Int.random(in: 0...3)
    if randomIV == 1{
        return .up
    }else if randomIV == 2{
        return .down
    }else if randomIV == 3 {
        return .left
    }else {
        return .right
    }
}
//        switch self {
//        case .up:
//            if self != robotway{
//                return .lose
//            }
//        case .down:
//            if self != robotway{
//                return .lose
//            }
//        case .left:
//            if self != robotway{
//                return .lose
//            }
//        case .right:
//            if self != robotway{
//                return .lose
//            }
//        }
