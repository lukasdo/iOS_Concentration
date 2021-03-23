//
//  Card.swift
//  Concentration
//
//  Created by Lukas on 10.02.19.
//  Copyright © 2019 Lukas. All rights reserved.
//

import Foundation

struct Card: Hashable
{
    var hashValue: Int { return identifier}
    
 //   func hashVal(into hasher: inout Hasher) {
   //     hasher = identifier
  //  }
    static func ==(lhs: Card, rhs: Card) -> Bool{ // Einführung von == 
        return lhs.identifier == rhs.identifier
    }
    //No inherit
    // Value Types, they are getting copied
    var isFaceUp = false
    var isMatched = false
    private var identifier: Int
    var cardString: String!
    
    static var identifierFactory = 0
    
    static func getUniqueIdentifier() -> Int{
        identifierFactory += 1
        return identifierFactory
    }
    
    init(){
        self.identifier = Card.getUniqueIdentifier()
        self.cardString = ""
    }
}
