//
//  StoryViewModel.swift
//  BTProjects
//
//  Created by Hilmy Noerfatih on 18/11/23.
//

import Foundation

struct StoryViewModel {
    func updateStoryIsReaded(storyPage: StoryPage){
        storyPage.isRead = true
        do{
            try PersistenceController.shared.viewContext.save()
        }catch(let error){
            print(error)
        }
    }
}
