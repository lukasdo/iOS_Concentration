//
//  ConcentrationModel.swift
//  Concentration
//
//  Created by Lukas on 10.02.19.
//  Copyright © 2019 Lukas. All rights reserved.
//

import Foundation


class Concentration
{
     private var emojiChoices = ["😇","🧐","🎃","💩","👻","🐒","🐬","💻","😪","🤥","H","!","1","2","3"
    ,"S","R","Q","Z","Y","X","G","F","E","D","C","B","A"]

    // Reference Types
    // Just passing pointers not copies
    
    var cards = [Card]()
    
    var intMatches: Int
    var isFinished: Bool
    private var flipCount: Int
    var flips: Int!{
        get{
            flipCount = flipCount + 1
            return flipCount
        }
    }
   
    private var scoreCount: Int!
    
    func getScore(isMatched: Bool) -> Int{
        if isMatched == true{
            self.scoreCount = self.scoreCount + 6
        }
        else{
            self.scoreCount = self.scoreCount - 1
        }
        return self.scoreCount
    }
    
    func didNotMatch(){
        
    }
    
    var indexOfFaceUpCard: Int?
    
    func chooseCard(at index: Int) -> Int{
        if !cards[index].isMatched{
            if let matchIndex = indexOfFaceUpCard, matchIndex != index {
                //check if cards match
                
                if cards[matchIndex] == cards[index] {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                    intMatches = intMatches - 1
                }
                cards[index].isFaceUp = true
                indexOfFaceUpCard = nil
            
        }else {
            // either no cards or 2 cards are face up
            for flipDownIndex in cards.indices{
                cards[flipDownIndex].isFaceUp  = false
            }
            cards[index].isFaceUp = true
            indexOfFaceUpCard = index
        }
    }
        if intMatches == 0{
            self.isFinished = true
        }
        return getScore(isMatched: cards[index].isMatched )
    }
    
    init(numberOfPairsOfCards: Int){
          for _ in 1...numberOfPairsOfCards{
            var card = Card()
            card.cardString = emojiChoices.remove(at: emojiChoices.count.arc4random)
            cards += [card,card]
        }
        
       var index = 0
           let indexArray = numberOfPairsOfCards*2 - 1
          
        for _ in index...indexArray{
            cards.swapAt(index, indexArray.arc4random)
            index = index + 1
        }
        isFinished = false
        intMatches = numberOfPairsOfCards
        flipCount = 0
        scoreCount = 0
        // TODO: SHUFFLE
    }

    func newGame(){
      
        // TODO: NEW GAME
    }
}
