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
    // Reference Types
    // Just passing pointers not copies
    var cards = [Card]()
    var intMatches: Int
    var isFinished: Bool
    
    var indexOfFaceUpCard: Int?
    
    func chooseCard(at index: Int){
        if !cards[index].isMatched{
            if let matchIndex = indexOfFaceUpCard, matchIndex != index {
                //check if cards match
                if cards[matchIndex].identifier == cards[index].identifier {
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
    }
    
    init(numberOfPairsOfCards: Int){
        for _ in 1...numberOfPairsOfCards{
            let card = Card()
            cards += [card,card]
        }
        isFinished = false
        intMatches = numberOfPairsOfCards
        
        // TODO: Shuffle the cards
    }
    
    func shuffleCars(){
        
    }
}
