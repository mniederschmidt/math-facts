//
//  StudentFact+CoreDataProperties.swift
//  MathFacts
//
//  Created by Mary Niederschmidt on 1/22/18.
//  Copyright © 2018 Mary Niederschmidt. All rights reserved.
//
//

import Foundation
import CoreData

enum FactType: String {
    case addition = "+"
    case subtraction = "-"
    case multiplication = "x"
    case division = "÷"
}

extension StudentFact {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<StudentFact> {
        return NSFetchRequest<StudentFact>(entityName: "StudentFact")
    }

    @NSManaged public var operand1: Int16
    @NSManaged public var operand2: Int16
    @NSManaged public var operation: String
    @NSManaged public var result: Int16
    @NSManaged public var correctInARow: Int16
    @NSManaged public var student: Student
    
    func getResult() -> Int16 {
        switch FactType(rawValue: self.operation)! {
        case .addition:
            return self.operand1 + self.operand2
        case .subtraction:
            return self.operand1 - self.operand2
        case .multiplication:
            return self.operand1 * self.operand2
        case .division:
            return self.operand1 / self.operand2
        }
    }
}
