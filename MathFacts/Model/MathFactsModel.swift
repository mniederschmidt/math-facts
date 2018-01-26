import Foundation

class MathFactsModel {

    // TODO:  Eventually, should this array hold StudentFact objects?
    var facts: [MathFact] = []
    let factsPersistence: FactsPersistence
//    let student: Student?
    var currFactIndex: Int = -1
    
    var add: Bool = false
    var subtract: Bool = false
    var multiply: Bool = false
    var divide: Bool = false
    
    enum FactType: String {
        case addition = "+"
        case subtraction = "-"
        case multiplication = "x"
        case division = "÷"
    }
    
//    init(factsPersistence: FactsPersistence, student: Student) {
    init(factsPersistence: FactsPersistence) {
        self.factsPersistence = factsPersistence
//        self.student = student
        self.facts = createFacts()
        // TODO:  Figure out how to populate Facts
    }
            
    func createFacts() -> [MathFact] {
//        // Hard code for now
        return [
            MathFact(factType: .addition, operand1: 3, operand2: 2, correctInARow: 0),
            MathFact(factType: .addition, operand1: 3, operand2: 3, correctInARow: 0),
            MathFact(factType: .addition, operand1: 3, operand2: 5, correctInARow: 0),
            MathFact(factType: .addition, operand1: 3, operand2: 8, correctInARow: 0),
            MathFact(factType: .addition, operand1: 3, operand2: 7, correctInARow: 0)
        ]
    }
    
    func reset() {
        add = false
        subtract = false
        multiply = false
        divide = false
        currFactIndex = -1
    }
    
    func nextFact() -> MathFact {
//        currFactIndex = currFactIndex + 1
//        return facts[currFactIndex]
        return facts[randomIndex()]
    }
    
    func allFactsMastered() -> Bool {
//        if facts.count == 0 {
        if facts.isEmpty {
            return true
        } else {
            return false
        }
    }
    
    func randomIndex() -> Int {
        return Int(arc4random_uniform(UInt32(facts.count)))
    }
}

