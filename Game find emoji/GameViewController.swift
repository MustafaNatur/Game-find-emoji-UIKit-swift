//
//  GameViewController.swift
//  Game find emoji
//
//  Created by Мустафа Натур on 11.11.2022.
//

import UIKit

class GameViewController: UIViewController {
    
    //@IBOutlet var buttons: [UIButton]!
    @IBOutlet var buttons: [UIButton]!
    
    lazy var game = Game(buttons.count)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        // Do any additional setup after loading the view.
    }
    
    
    func setupView() {
        for index in 0..<buttons.count {
            buttons[index].setTitle(game.items[index].itemLabel, for: .normal)
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
