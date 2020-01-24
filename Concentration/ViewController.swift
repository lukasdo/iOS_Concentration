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
    
    var flipCount = 0{
        didSet{
            flipCountLabel.text = "Flips: \(flipCount)"
        }
    }
    
    @IBOutlet weak var flipCountLabel: UILabel! //Doesnt have to be initialized
    
    @IBOutlet var cardButtons: [UIButton]!
    
    
    
    @IBAction func touchCard(_ sender: UIButton) {
        flipCount += 1
        if let cardNumber = cardButtons.index(of: sender){
            game.chooseCard(at: cardNumber)
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
                button.setTitle(intEmoji(for: card), for:.normal)
                button.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
            }else {
                button.setTitle("", for:.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1) : #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
            }
        }
    }
    var emojiChoices = ["😇","🧐","🎃","💩","👻","🐒","🐬","💻","😪","🤥","H","!","1","2","3"
                        ,"S","R","Q","Z","Y","X","G","F","E","D","C","B","A"]
    var emoji = Dictionary<Int,String>()
    
    func intEmoji(for card: Card) -> String{ // Insert to Dictionary
        if emoji[card.identifier] == nil , emojiChoices.count > 0 {
                let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count)))
                emoji[card.identifier] = emojiChoices.remove(at: randomIndex)



            }
        return emoji[card.identifier] ?? "?"
    }
}

