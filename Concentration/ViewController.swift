//
//  ViewController.swift
//  Concentration
//
//  Created by Lukas on 10.02.19.
//  Copyright © 2019 Lukas. All rights reserved.
// -> Int = Return int von der Func
// Outlet = Instance Variable
// Action = Method

import UIKit

class ViewController: UIViewController
{
    lazy var game = Concentration(numberOfPairsOfCards: (cardButtons.count) / 2)

   private var flipCount = 0{
        didSet{
            flipCountLabel.text = "Flips: \(flipCount)"
        }
    }
    private var score = 0{
        didSet{
            scoreLabel.text = "Score: \(score)"
        }
    }
    
    @IBOutlet weak var flipCountLabel: UILabel! //Doesnt have to be initialized
    
    @IBOutlet var scoreLabel: UILabel!
    
    @IBOutlet var cardButtons: [UIButton]!
    
    
    
 //   @IBOutlet var cardButtons: [UIButton]!
    
    @IBOutlet var newGameButton: UIButton!
    
    @IBAction func onNewGame(_ sender: Any) {
        self.score = 0
        self.flipCount = 0
        game = Concentration(numberOfPairsOfCards: (cardButtons.count) / 2)
        updateViewFromModel()
    }
    
    @IBAction func touchCard(_ sender: UIButton) {
        flipCount = game.flips
        if let cardNumber = cardButtons.index(of: sender){
            self.score = game.chooseCard(at: cardNumber)
            updateViewFromModel()
        }else {
            print("Card not in cardButton")
        }
        if game.isFinished{
            print("Game is finished!")
        }
    }
    
    func updateViewFromModel(){
        for index in cardButtons.indices{
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp{
                button.setTitle(card.cardString, for: .normal)
                button.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
            }else {
                button.setTitle("", for:.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1) : #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
            }
        }
    }


}


extension Int {
    var arc4random: Int {
        if self > 0 {
            return Int(arc4random_uniform(UInt32(self)))
        }
        else if self < 0 {
            return -Int(arc4random_uniform(UInt32(self)))
        }
        else {
            return 0
        }
        
    }

    
}
