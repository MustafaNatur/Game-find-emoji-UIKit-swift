//
//  StartViewController.swift
//  Game find emoji
//
//  Created by Мустафа Натур on 17.11.2022.
//

import UIKit

class StartViewController: UIViewController {
    
    @IBOutlet var buttons: [UIButton]!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        for button in  buttons {
            button.layer.cornerRadius = 20
        }
    }
}
