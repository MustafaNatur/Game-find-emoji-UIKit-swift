//
//  SettingsTableViewController.swift
//  Game find emoji
//
//  Created by Мустафа Натур on 21.11.2022.
//

import UIKit

class SettingsTableViewController: UITableViewController {

    @IBOutlet weak var switchTimerState: UISwitch!
    @IBOutlet weak var timeGameLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadSettings()
    }
    
    @IBAction func changeTimerState(_ sender: UISwitch) {
        Settings.shared.currentSettings.timerState = sender.isOn
    }
    
    func loadSettings() {
        timeGameLabel.text = "\(Settings.shared.currentSettings.timeForGame) sec"
        switchTimerState.isOn = Settings.shared.currentSettings.timerState
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "toTimerSettings":
            if let tsvc = segue.destination as? SelectTimeViewController {
                tsvc.data = [10, 20, 30, 40, 50 ,60 ,70, 80, 90, 100, 110, 120]
            }
        default:
            break
        }
    }
    
}
