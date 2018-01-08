//
//  MathFactsModel.swift
//  MathFacts
//
//  Created by Mary Niederschmidt on 1/6/18.
//  Copyright © 2018 Mary Niederschmidt. All rights reserved.
//

import Foundation

//enum FactType {
//    case addition
//    case subtraction
//    case multiplication
//    case division
//}

class MathFactsModel {
    
    var add: Bool = false
    var subtract: Bool = false
    var multiply: Bool = false
    var divide: Bool = false
    
    enum FactType {
        case addition
        case subtraction
        case multiplication
        case division
    }
    
    let facts: [MathFact]
    var currFactIndex: Int = -1
    
    init() {
//        self.facts = []
        // Hard code for now
        
        self.facts = [
            MathFact(factType: .addition, operand1: 3, operand2: 2, correctInARow: 0),
            MathFact(factType: .addition, operand1: 3, operand2: 3, correctInARow: 0)
        ]
    }
    
    func reset() {
        add = false
        subtract = false
        multiply = false
        divide = false
    }
    
    func nextFact() -> MathFact {
        currFactIndex = currFactIndex + 1
        return facts[currFactIndex]
    }
}

