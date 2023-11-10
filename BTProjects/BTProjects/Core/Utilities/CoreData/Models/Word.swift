//
//  Word.swift
//  BTProjects
//
//  Created by Hilmy Noerfatih on 09/11/23.
//

import CoreData

public class Word: NSManagedObject, Decodable {
    enum CodingKeys: CodingKey {
        case name, signLanguage
    }
    
    required convenience public init(from decoder: Decoder) throws {
        guard let context = decoder.userInfo[CodingUserInfoKey.managedObjectContext] as? NSManagedObjectContext else {
            throw DecoderConfigurationError.missingManagedObjectContext
        }
        
        self.init(context: context)
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decode(String.self, forKey: .name)
        self.signLanguage = try container.decode(String.self, forKey: .signLanguage)
    }
    
}
