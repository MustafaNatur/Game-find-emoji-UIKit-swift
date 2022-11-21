//
//  SettingsViewController.swift
//  Game find emoji
//
//  Created by Мустафа Натур on 17.11.2022.
//

import UIKit

class SettingsViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "toTimerSettigs":
            if let tsvc = segue.destination as? SelectTimeViewController {
                tsvc.data = [10, 20, 30, 40, 50 ,60 ,70, 80, 90, 100, 110, 120]
            }
        default:
            break
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
