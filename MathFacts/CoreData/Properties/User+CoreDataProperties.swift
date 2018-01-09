//
//  User+CoreDataProperties.swift
//  MathFacts
//
//  Created by Mary Niederschmidt on 1/9/18.
//  Copyright © 2018 Mary Niederschmidt. All rights reserved.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var email: String?
    @NSManaged public var password: NSData?
    @NSManaged public var username: String?
    @NSManaged public var students: NSSet?

}

// MARK: Generated accessors for students
extension User {

    @objc(addStudentsObject:)
    @NSManaged public func addToStudents(_ value: Student)

    @objc(removeStudentsObject:)
    @NSManaged public func removeFromStudents(_ value: Student)

    @objc(addStudents:)
    @NSManaged public func addToStudents(_ values: NSSet)

    @objc(removeStudents:)
    @NSManaged public func removeFromStudents(_ values: NSSet)

}
