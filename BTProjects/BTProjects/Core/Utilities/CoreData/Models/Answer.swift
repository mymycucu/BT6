//
//  Answer.swift
//  BTProjects
//
//  Created by Hilmy Noerfatih on 09/11/23.
//

import CoreData

public class Answer: NSManagedObject, Decodable {
    enum CodingKeys: CodingKey {
        case name, type, signLanguage, illustration, isCorrect
    }
    
    required convenience public init(from decoder: Decoder) throws {
        guard let context = decoder.userInfo[CodingUserInfoKey.managedObjectContext] as? NSManagedObjectContext else {
            throw DecoderConfigurationError.missingManagedObjectContext
        }
        
        self.init(context: context)
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decode(String.self, forKey: .name)
        self.type = try container.decode(Int16.self, forKey: .type)
        self.signLanguage = try container.decode(String.self, forKey: .signLanguage)
        self.illustration = try container.decode(String.self, forKey: .illustration)
        self.isCorrect = try container.decode(Bool.self, forKey: .isCorrect)
    }
}
