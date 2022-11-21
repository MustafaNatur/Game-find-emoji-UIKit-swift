//
//  Settings.swift
//  Game find emoji
//
//  Created by Мустафа Натур on 21.11.2022.
//

import Foundation

enum KeysUserDefaults {
    static let settingsGame = "settingsGame"
}

struct SettingsGame: Codable {
    var timerState:Bool
    var timeForGame:Int
}


class Settings {
    static var shared = Settings()
    private let defaultSettings = SettingsGame(timerState: true, timeForGame: 30)
    var currentSettings: SettingsGame {
        get {
            if let data = UserDefaults.standard.object(forKey: KeysUserDefaults.settingsGame) as? Data{
                return try! PropertyListDecoder().decode(SettingsGame.self, from: data)
            } else {
                return defaultSettings
            }
        }
        
        set {
            if let data = try? PropertyListEncoder().encode(newValue){
                UserDefaults.standard.setValue(data, forKey: KeysUserDefaults.settingsGame)
            }
        }
    }
    
    func resetSettings() {
        self.currentSettings = defaultSettings
    }
}
