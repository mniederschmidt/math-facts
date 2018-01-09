//
//  StudentFact+CoreDataProperties.swift
//  MathFacts
//
//  Created by Mary Niederschmidt on 1/9/18.
//  Copyright © 2018 Mary Niederschmidt. All rights reserved.
//
//

import Foundation
import CoreData


extension StudentFact {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<StudentFact> {
        return NSFetchRequest<StudentFact>(entityName: "StudentFact")
    }

    @NSManaged public var correctInARow: Int32
    @NSManaged public var mathFact: MathFact?
    @NSManaged public var student: Student?

}
