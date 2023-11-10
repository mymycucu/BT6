//
//  Category.swift
//  BTProjects
//
//  Created by Hilmy Noerfatih on 08/11/23.
//

import CoreData

public class Category: NSManagedObject, Decodable {
    enum CodingKeys: CodingKey {
        case name
    }
    
    required convenience public init(from decoder: Decoder) throws {
        guard let context = decoder.userInfo[CodingUserInfoKey.managedObjectContext] as? NSManagedObjectContext else {
            throw DecoderConfigurationError.missingManagedObjectContext
        }
        
        self.init(context: context)
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decode(String.self, forKey: .name)
    }
    
    var book: [Book] {
        ((books?.allObjects as? [Book]) ?? [Book]())
    }
}
