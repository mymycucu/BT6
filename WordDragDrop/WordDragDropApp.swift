//
//  WordDragDropApp.swift
//  WordDragDrop
//
//  Created by Sarah Uli Octavia on 10/10/23.
//

import SwiftUI

@main
struct WordDragDropApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            LearningModule()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
