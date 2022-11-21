//
//  Model.swift
//  Game find emoji
//
//  Created by Мустафа Натур on 11.11.2022.
//

import Foundation

enum StatusGame: String {
    case start = "Let's go!"
    case win = "You win!"
    case lose = "Game over..."
}

struct item {
    var itemLabel: String
    var isFound: Bool
    var isError = false
}

class Game {
    
    var array = Array(0x1F601...0x1F64F)
    
    var items:[item] = []
    
    var itemsCount:Int
    
    var targetItem:item?
    
    var timer:Timer?
    
    var updateTimer:((StatusGame, Int)->Void)

    var statusGame:StatusGame = .start {
        didSet {
            if (statusGame == .lose || statusGame == .win) {
                stopGame()
            }
        }
    }
    
    private var timeForGame:Int
    var secondsGame:Int {
        didSet{
            if secondsGame == 0 {
                statusGame = .lose
            }
            updateTimer(statusGame,secondsGame)
        }
    }
    

    
    init(_ count:Int, updateTimer:@escaping (_ status:StatusGame, _ seconds:Int)->Void){
        self.itemsCount = count
        self.secondsGame = Settings.shared.currentSettings.timeForGame
        self.updateTimer = updateTimer
        self.timeForGame = Settings.shared.currentSettings.timeForGame
        setupGame()
    }

    func setupGame() {
        var randomData = array.shuffled()
        items.removeAll()
        for _ in 0..<itemsCount {
            let item = item(itemLabel: String(UnicodeScalar(randomData.removeFirst())!), isFound: false)
            items.append(item)
        }
        updateTargetNumber()
        updateTimer(statusGame, secondsGame)
        
        guard !Settings.shared.currentSettings.timerState else {
            timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: {[weak self] (_) in self?.secondsGame -= 1
            })
            return
        }
    }
    
    func newGame() {
        statusGame = .start
        self.secondsGame = self.timeForGame
        setupGame()
    }
    
    func updateTargetNumber() {
        targetItem = items.shuffled().first
    }
    
    func check(find: Int) {
        guard statusGame == .start else {return}
        if (items[find].itemLabel == targetItem?.itemLabel) {
            items[find].isFound = true
            targetItem = items.shuffled().first(where: {(item) -> Bool in item.isFound == false})
        } else {
            items[find].isError = true
        }
        
        if (targetItem == nil) {
            statusGame = .win
        }
    }
    
    func stopGame() {
        timer?.invalidate()
    }
}

extension Int {
    func secondsToString()->String {
        let min = self / 60
        let sec = self % 60
        
        return String(format: "%d:%02d", min, sec)
    }
}
