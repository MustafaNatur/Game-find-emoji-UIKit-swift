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
    
    var array = Array(1...99)
    
    var items:[item] = []
    
    var itemsCount:Int
    
    init(_ count:Int){
        self.itemsCount = count
        arrInit()
    }
    
    func arrInit() {
        var randomData = array.shuffled()
        for _ in 0..<itemsCount {
            let item = item(itemLabel: String(randomData.removeFirst()), isFound: false)
            items.append(item)
        }
    }
    
}
