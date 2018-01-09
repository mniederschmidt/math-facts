//
//  Student+CoreDataProperties.swift
//  MathFacts
//
//  Created by Mary Niederschmidt on 1/9/18.
//  Copyright © 2018 Mary Niederschmidt. All rights reserved.
//
//

import Foundation
import CoreData


extension Student {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Student> {
        return NSFetchRequest<Student>(entityName: "Student")
    }

    @NSManaged public var firstName: String?
    @NSManaged public var imageFileName: String?
    @NSManaged public var lastName: String?
    @NSManaged public var maxNum: Int32
    @NSManaged public var preferredName: String?
    @NSManaged public var timeSetting: Float
    @NSManaged public var studentFacts: NSSet?
    @NSManaged public var user: User?

}

// MARK: Generated accessors for studentFacts
extension Student {

    @objc(addStudentFactsObject:)
    @NSManaged public func addToStudentFacts(_ value: StudentFact)

    @objc(removeStudentFactsObject:)
    @NSManaged public func removeFromStudentFacts(_ value: StudentFact)

    @objc(addStudentFacts:)
    @NSManaged public func addToStudentFacts(_ values: NSSet)

    @objc(removeStudentFacts:)
    @NSManaged public func removeFromStudentFacts(_ values: NSSet)

}
