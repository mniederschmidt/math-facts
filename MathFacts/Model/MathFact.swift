import Foundation

struct MathFact {
    let factType: MathFactsModel.FactType
    let operand1: Int
    let operand2: Int
    var correctInARow: Int
    
    func result() -> Int {
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
