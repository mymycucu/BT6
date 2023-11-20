//
//  SummaryViewModel.swift
//  BTProjects
//
//  Created by Hilmy Noerfatih on 20/11/23.
//

import Foundation

struct SummaryViewModel {
    func updateBookIsReaded(book: Book){
        book.isRead = true
        do{
            try PersistenceController.shared.viewContext.save()
        }catch(let error){
            print(error)
        }
    }
}
