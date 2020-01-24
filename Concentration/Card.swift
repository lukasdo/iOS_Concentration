//
//  Card.swift
//  Concentration
//
//  Created by Lukas on 10.02.19.
//  Copyright © 2019 Lukas. All rights reserved.
//

import Foundation

struct Card
{
    //No inherit
    // Value Types, they are getting copied
    var isFaceUp = false
    var isMatched = false
    let identifier: Int
    
    static var identifierFactory = 0
    
    static func getUniqueIdentifier() -> Int{
        identifierFactory += 1
        return identifierFactory
    }
    
    init(){
        self.identifier = Card.getUniqueIdentifier()
    }
}
