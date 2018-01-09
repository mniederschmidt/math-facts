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
    
    enum FactType: String {
        case addition = "+"
        case subtraction = "-"
        case multiplication = "x"
        case division = "/"
    }
    
    let facts: [DMMathFact]
    var currFactIndex: Int = -1
    
    init() {
        self.facts = MathFactsModel.createFacts()
    }
            
    static func createFacts() -> [DMMathFact] {
        //        self.facts = []
        // Hard code for now

        return [
            DMMathFact(factType: .addition, operand1: 3, operand2: 2, correctInARow: 0),
            DMMathFact(factType: .addition, operand1: 3, operand2: 3, correctInARow: 0),
            DMMathFact(factType: .addition, operand1: 3, operand2: 5, correctInARow: 0),
            DMMathFact(factType: .addition, operand1: 3, operand2: 8, correctInARow: 0),
            DMMathFact(factType: .addition, operand1: 3, operand2: 7, correctInARow: 0)
        ]
    }
    
    func reset() {
        add = false
        subtract = false
        multiply = false
        divide = false
        currFactIndex = -1
    }
    
    func nextFact() -> DMMathFact {
        currFactIndex = currFactIndex + 1
        return facts[currFactIndex]
    }
    
    func allFactsMastered() -> Bool {
        if currFactIndex >= facts.count - 1 {
            return true
        } else {
            return false
        }
    }
}

