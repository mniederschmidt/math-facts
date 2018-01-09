//
//  MathFact.swift
//  MathFacts
//
//  Created by Mary Niederschmidt on 1/8/18.
//  Copyright © 2018 Mary Niederschmidt. All rights reserved.
//

import Foundation

struct DMMathFact {
    let factType: MathFactsModel.FactType
    let operand1: Int32
    let operand2: Int32
    var correctInARow: Int
    
    func result() -> Int32 {
        switch factType {
        case .addition:
            return operand1 + operand2
        case .subtraction:
            return operand1 - operand2
        case .multiplication:
            return operand1 * operand2
        case .division:
            return operand1 / operand2
        }
    }
    
    func sign() -> String {
        switch factType {
        case .addition:
            return "+"
        case .subtraction:
            return "-"
        case .multiplication:
            return "x"
        case .division:
            return "÷"
        }
    }
}
