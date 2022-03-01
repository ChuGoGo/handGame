//
//  ViewController.swift
//  handGame
//
//  Created by Chu Go-Go on 2022/2/24.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var scissorBT: UIButton!
    @IBOutlet weak var stoneBT: UIButton!
    @IBOutlet weak var robotLB: UILabel!
    @IBOutlet weak var PaperBT: UIButton!
    @IBOutlet weak var gameStyle: UISegmentedControl!
    @IBOutlet weak var resultLB: UILabel!
    @IBOutlet weak var playAgainBT: UIButton!
    @IBOutlet weak var winLB: UILabel!
    @IBOutlet weak var loseLB: UILabel!
    @IBOutlet weak var robotWayIV: UIImageView!
    @IBOutlet weak var upBT: UIButton!
    @IBOutlet weak var rightBT: UIButton!
    @IBOutlet weak var downBT: UIButton!
    @IBOutlet weak var leftBT: UIButton!
//    計算勝場
    var winCount = 0
//    計算敗場
    var loseCount = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
            updateUI(result: .start)
    }
//    選擇要玩哪個遊戲
    @IBAction func changeGameSeg(_ sender: UISegmentedControl) {
        if gameStyle.selectedSegmentIndex == 0{
            updateUI(result: .start)
        }else{
            guessWayupdateUI(result: .chooseWay)
            view.backgroundColor = .systemPink
        }
    }
    @IBAction func scissorButton(_ sender: UIButton) {
        playGame(yourSign: .scissors)
    }
    @IBAction func stoneButton(_ sender: UIButton) {
        playGame(yourSign: .rock)
    }
    @IBAction func paperButton(_ sender: UIButton) {
        playGame(yourSign: .paper)
    }
    @IBAction func PlayAgainButton(_ sender: UIButton) {
        if gameStyle.selectedSegmentIndex == 0{
            updateUI(result: .start)
        }else{
            guessWayupdateUI(result: .chooseWay)
        }
    }
//    重置遊戲
    @IBAction func resetButton(_ sender: UIButton) {
        gameStyle.selectedSegmentIndex = 0
        reset()
        updateUI(result: .start)
    }
    @IBAction func upButton(_ sender: UIButton) {
        playChooseWay(playerChoose: .up)
    }
    @IBAction func rightButton(_ sender: UIButton) {
        playChooseWay(playerChoose: .right)
    }
    @IBAction func downButton(_ sender: Any) {
        playChooseWay(playerChoose: .down)
    }
    @IBAction func leftButton(_ sender: UIButton) {
        playChooseWay(playerChoose: .left)
    }
    
    //    建立一個起始跟勝敗平手後的畫面
    func updateUI(result: GameResult){
        //        結果會帶入enum裡的結果
        resultLB.text = result.results
        //        編輯每個畫面的執行
        switch result {
            //            編輯起始畫面的內容
        case .start:
            view.backgroundColor = .systemGray2
            robotLB.text = "🤖"
            robotWayIV.isHidden = true
            playAgainBT.isHidden = true
            //            顯示出拳按鍵
            stoneBT.isHidden = false
            PaperBT.isHidden = false
            scissorBT.isHidden = false
            //            讓按鍵可以按
            stoneBT.isEnabled = true
            PaperBT.isEnabled = true
            scissorBT.isEnabled = true
//            隱藏黑白猜
            upBT.isHidden = true
            downBT.isHidden = true
            rightBT.isHidden = true
            leftBT.isHidden = true
            //            編輯贏了之後的動作
        case .win:
            view.backgroundColor = .systemYellow
//            勝場＋1
            winCount += 1
        case .lose:
            view.backgroundColor = .systemRed
//            敗場+1
            loseCount += 1
        case .draw:
            view.backgroundColor = .systemGreen
        }
        winLB.text = "W:\(winCount)"
        loseLB.text = "L:\(loseCount)"
    }
    func playGame(yourSign: Sign){
        //        宣告一個機器人讓他會從亂數裡選一個拳投
        let robotGame = robotRandomSign()
        //        宣告玩家出拳
        let userGame = yourSign.game(robotSign: robotGame)
        //        跑到 updateUI看會跑哪一個條件
        updateUI(result: userGame)
        //        robotLB顯示亂數出現的拳
        robotLB.text = robotGame.emoji
        //       隱藏出拳的按鈕
        stoneBT.isHidden = true
        PaperBT.isHidden = true
        scissorBT.isHidden = true
        robotWayIV.isHidden = true
        //        讓按鈕不能按
        stoneBT.isEnabled = false
        PaperBT.isEnabled = false
        scissorBT.isEnabled = false
        //        當你按到你出拳的按鈕 他會顯示
        switch yourSign {
        case .rock:
            stoneBT.isHidden = false
        case .paper:
            PaperBT.isHidden = false
        case .scissors:
            scissorBT.isHidden = false
        }
        playAgainBT.isHidden = false
    }
    func reset(){
        winCount = 0
        loseCount = 0
        winLB.text = "W:\(winCount)"
        loseLB.text = "L:\(loseCount)"
    }
    func guessWayupdateUI(result: BlackWhiteGameResult){
        //        結果會帶入enum裡的結果
        resultLB.text = result.gameresults
        //        編輯每個畫面的執行
        switch result {
            //            編輯起始畫面的內容
        case .chooseWay:
            view.backgroundColor = .systemGray2
            robotLB.text = "🤖"
            robotWayIV.isHidden = true
            playAgainBT.isHidden = true
            upBT.isHidden = false
            downBT.isHidden = false
            rightBT.isHidden = false
            leftBT.isHidden = false
            //            隱藏出拳按鍵
            stoneBT.isHidden = true
            PaperBT.isHidden = true
            scissorBT.isHidden = true
            //            讓按鍵可以按
            stoneBT.isEnabled = false
            PaperBT.isEnabled = false
            scissorBT.isEnabled = false
            //            編輯贏了之後的動作
        case .win:
            view.backgroundColor = .orange
            winCount += 1
        case .lose:
            view.backgroundColor = .purple
            playAgainBT.isHidden = false
            loseCount += 1
        }
        winLB.text = "W:\(winCount)"
        loseLB.text = "L:\(loseCount)"
    }
    func playChooseWay(playerChoose: BlackWhiteGuess){
        //        宣告一個機器人讓他會從亂數裡選一個拳投
        let roboChoose = robotRodomGuess()
        //        宣告玩家出拳
        let playerGame = playerChoose.guessGame(robotway: roboChoose)
        //        跑到 updateUI看會跑哪一個條件
        guessWayupdateUI(result: playerGame)
        //        robotLB顯示亂數出現的拳
        robotWayIV.image = UIImage(named: roboChoose.wayImage)
        robotWayIV.isHidden = false
        //       隱藏出拳的按鈕
        upBT.isHidden = true
        downBT.isHidden = true
        rightBT.isHidden = true
        leftBT.isHidden = true
        stoneBT.isHidden = true
        PaperBT.isHidden = true
        scissorBT.isHidden = true
        //        讓按鈕不能按
        stoneBT.isEnabled = false
        PaperBT.isEnabled = false
        scissorBT.isEnabled = false
        //        當你按到你出拳的按鈕 他會顯示
        switch playerChoose {
        case .up:
            upBT.isHidden = false
        case .down:
            downBT.isHidden = false
        case .left:
            leftBT.isHidden = false
        case .right:
            rightBT.isHidden = false
        }
        playAgainBT.isHidden = false
    }
    
}

