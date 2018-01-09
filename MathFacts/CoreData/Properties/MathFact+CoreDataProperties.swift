//
//  MathFact+CoreDataProperties.swift
//  MathFacts
//
//  Created by Mary Niederschmidt on 1/9/18.
//  Copyright © 2018 Mary Niederschmidt. All rights reserved.
//
//

import Foundation
import CoreData


extension MathFact {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<MathFact> {
        return NSFetchRequest<MathFact>(entityName: "MathFact")
    }

    @NSManaged public var operand1: Int32
    @NSManaged public var operand2: Int32
    @NSManaged public var operation: String?
    @NSManaged public var studentFacts: NSSet?

}

// MARK: Generated accessors for studentFacts
extension MathFact {

    @objc(addStudentFactsObject:)
    @NSManaged public func addToStudentFacts(_ value: StudentFact)

    @objc(removeStudentFactsObject:)
    @NSManaged public func removeFromStudentFacts(_ value: StudentFact)

    @objc(addStudentFacts:)
    @NSManaged public func addToStudentFacts(_ values: NSSet)

    @objc(removeStudentFacts:)
    @NSManaged public func removeFromStudentFacts(_ values: NSSet)

}
