//
//  QuestionEntity+CoreDataProperties.swift
//  WordDragDrop
//
//  Created by Sarah Uli Octavia on 11/10/23.
//
//

import Foundation
import CoreData


extension QuestionEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<QuestionEntity> {
        return NSFetchRequest<QuestionEntity>(entityName: "QuestionEntity")
    }

    @NSManaged public var questionValue: NSObject?
    @NSManaged public var questionType: String?

}

extension QuestionEntity : Identifiable {

}