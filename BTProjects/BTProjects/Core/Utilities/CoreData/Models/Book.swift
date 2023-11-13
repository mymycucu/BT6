//
//  Book.swift
//  BTProjects
//
//  Created by Hilmy Noerfatih on 09/11/23.
//

import CoreData

public class Book: NSManagedObject, Decodable {
    enum CodingKeys: CodingKey {
        case name, storyPages,categories
    }
    
    required convenience public init(from decoder: Decoder) throws {
        guard let context = decoder.userInfo[CodingUserInfoKey.managedObjectContext] as? NSManagedObjectContext else {
            throw DecoderConfigurationError.missingManagedObjectContext
        }
        
        self.init(context: context)
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decode(String.self, forKey: .name)
//        let categories = try container.decode(Set<String>.self, forKey: .categories)
//        var coreDataCategories = Set<Category>()
//        
//        for strCategory in categories {
//            let categoriesFetchRequest: NSFetchRequest<Category> = Category.fetchRequest()
//            categoriesFetchRequest.predicate = NSPredicate(format: "name == %@", strCategory)
//            let categoryFromCoreData = try PersistenceController.shared.viewContext.fetch(categoriesFetchRequest)
//            
//            if categoryFromCoreData.isEmpty {
//                let category = PersistenceController.shared.create(Category.self)
//                category?.name = strCategory
//                category?.id = UUID()
//                coreDataCategories.insert(category!)
//            }else{
//                coreDataCategories.insert(categoryFromCoreData.first!)
//            }
//        }
//        self.categories = coreDataCategories as NSSet
        self.storyPages = try container.decode(Set<StoryPage>.self, forKey: .storyPages) as NSSet
    }
    
    var category: [Category] {
        ((categories?.allObjects as? [Category]) ?? [Category]())
    }
    
    var story: [StoryPage] {
        ((storyPages?.allObjects as? [StoryPage]) ?? [StoryPage]()).sorted { $0.order < $1.order }
    }
    
    var lstQuestions: [Question] {
        ((questions?.allObjects as? [Question]) ?? [Question]()).sorted { $0.order < $1.order }
    }
}


