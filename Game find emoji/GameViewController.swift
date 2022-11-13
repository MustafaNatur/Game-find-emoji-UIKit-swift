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
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var newGameButton: UIButton!
    @IBOutlet var buttons: [UIButton]!
    
    lazy var game = Game(buttons.count, 30) { status, seconds in
        self.timerLabel.text = seconds.secondsToString()
        self.updateStatus(status: status)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    
    func setupView() {
        for index in 0..<buttons.count {
            buttons[index].setTitle(game.items[index].itemLabel, for: .normal)
            buttons[index].alpha = 1
            buttons[index].isEnabled = true
            buttons[index].layer.cornerRadius = 25
        }
        targetNuberLabel.text = game.targetItem?.itemLabel
        newGameButton.layer.cornerRadius = 25
        newGameButton.isHidden = true
    }
    
    @IBAction func newGamePressed(_ sender: UIButton) {
        game.newGame()
        sender.isHidden = true
        setupView()
    }
    

    @IBAction func buttonPressed(_ sender: UIButton) {
        guard let buttonIndex = buttons.firstIndex(of: sender) else {return}
        game.check(find: buttonIndex)
        updateView()
    }
    
    func updateView() {
        for index in game.items.indices {
            //buttons[index].isHidden = game.items[index].isFound
            buttons[index].alpha = game.items[index].isFound ? 0 : 1
            buttons[index].isEnabled = !game.items[index].isFound
            if game.items[index].isError {
                UIView.animate(withDuration: 0.3) { [weak self] in
                    self?.buttons[index].backgroundColor = .red
                } completion: { [weak self] (_) in
                    self?.buttons[index].backgroundColor = UIColor(red: 87/255, green: 95/255, blue: 214/255, alpha: 1)
                    self?.game.items[index].isError = false
                }
            }
        }
        targetNuberLabel.text = game.targetItem?.itemLabel
        updateStatus(status: game.statusGame)
        
    }
    
    func updateStatus(status: StatusGame) {
        if status == .start {
            newGameButton.isHidden = true
        } else if (status == .lose) {
            newGameButton.isHidden = false
        } else if (status == .win) {
            newGameButton.isHidden = false
        }
        statusLabel.text = status.rawValue
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
