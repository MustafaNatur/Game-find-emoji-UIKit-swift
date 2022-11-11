//
//  Model.swift
//  Game find emoji
//
//  Created by Мустафа Натур on 11.11.2022.
//

import Foundation

struct item {
    var itemLabel: String
    var isFound: Bool
}

class Game {
    
    var array = Array(0x1F601...0x1F64F)
    
    var items:[item] = []
    
    var itemsCount:Int
    
    var targetItem:item?
    
    init(_ count:Int){
        self.itemsCount = count
        arrInit()
    }
    
    func arrInit() {
        var randomData = array.shuffled()
        for _ in 0..<itemsCount {
            let item = item(itemLabel: String(UnicodeScalar(randomData.removeFirst())!), isFound: false)
            items.append(item)
        }
        updateTargetNumber()
    }
    
    func updateTargetNumber() {
        targetItem = items.shuffled().first
    }
    
    func check(find: Int) {
        if (items[find].itemLabel == targetItem?.itemLabel) {
            items[find].isFound = true
            targetItem = items.shuffled().first(where: {(item) -> Bool in item.isFound == false})
        }
    }
    
}
