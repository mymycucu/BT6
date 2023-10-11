//
//  QuestionEntity+CoreDataClass.swift
//  WordDragDrop
//
//  Created by Sarah Uli Octavia on 11/10/23.
//
//

import Foundation
import CoreData

@objc(QuestionEntity)
public class QuestionEntity: NSManagedObject {
    @NSManaged public var questionValue : [NSString]
    
}
