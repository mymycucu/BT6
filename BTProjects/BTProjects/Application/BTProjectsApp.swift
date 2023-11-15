//
//  BTProjectsApp.swift
//  BTProjects
//
//  Created by Hilmy Noerfatih on 21/10/23.
//

import SwiftUI

@main
struct BTProjectsApp: App {
    @StateObject var appState = AppState()
        
    var body: some Scene {
        WindowGroup {
            ContentView()
//            WordSummaryView(isMenu: Binding.constant(false))
//            MultipleChoiceView(isMenu: Binding.constant(false))
//            ConnectImagesView(isMenu: .constant(false), bookScene: .constant(3), maxBookScene: 5)
                .environmentObject(appState)
            
        }
    }
}

