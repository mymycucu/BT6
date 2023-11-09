//
//  ContentView.swift
//  BTProjects
//
//  Created by Hilmy Noerfatih on 08/11/23.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var appState: AppState
    var body: some View {
        coreDataTestView()
            .environmentObject(appState)
            .environment(\.managedObjectContext, appState.persistenceController.container.viewContext)
    }
}

#Preview {
    ContentView()
}
