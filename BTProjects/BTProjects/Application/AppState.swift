//
//  AppState.swift
//  BTProjects
//
//  Created by Hilmy Noerfatih on 08/11/23.
//

import Foundation
import CoreData

class AppState: ObservableObject {
    let persistenceController = PersistenceController.shared
    
    var firstRun = UserDefaults.standard.bool(forKey: "firstRun")
    let preview: Bool
    
    init(preview: Bool = false) {
        self.preview = preview
        if !firstRun {
            appDataInit()
            firstRun = true
            UserDefaults.standard.setValue(firstRun, forKey: "firstRun")
        }
    }
    
    func appDataInit(){
        DataFeedManager().createAllData()
//        let dataFeedManagers = DataFeedManager()
//        _ = dataFeedManagers.bulkCreateCategory()
//        _ = dataFeedManagers.bulkCreateBook()
//        for jsonCategory in jsonCategories {
//            let category = PersistenceController.shared.create(Category.self)
//            category?.name = jsonCategory.name
//            category?.id = UUID()
//        do{
//            try PersistenceController.shared.viewContext.save()
//        }catch(let error){
//            print(error)
//        }
//        }
        

        
    }
        
    
}

