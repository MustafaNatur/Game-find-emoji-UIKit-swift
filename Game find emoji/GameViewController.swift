//
//  GameViewController.swift
//  Game find emoji
//
//  Created by Мустафа Натур on 11.11.2022.
//

import UIKit

class GameViewController: UIViewController {
    
    //@IBOutlet var buttons: [UIButton]!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var targetNuberLabel: UILabel!
    @IBOutlet var buttons: [UIButton]!
    
    lazy var game = Game(buttons.count)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    
    func setupView() {
        for index in 0..<buttons.count {
            buttons[index].setTitle(game.items[index].itemLabel, for: .normal)
            buttons[index].layer.cornerRadius = 25
        }
        targetNuberLabel.text = game.targetItem?.itemLabel
    }


    @IBAction func buttonPressed(_ sender: UIButton) {
        guard let buttonIndex = buttons.firstIndex(of: sender) else {return}
        game.check(find: buttonIndex)
        updateView()
    }
    
    func updateView() {
        for index in game.items.indices {
            buttons[index].isHidden = game.items[index].isFound
        }
        targetNuberLabel.text = game.targetItem?.itemLabel
        
        if (game.statusGame == .win) {
            statusLabel.text = "You win!"
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
