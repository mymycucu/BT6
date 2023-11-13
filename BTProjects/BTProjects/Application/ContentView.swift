//
//  ContentView.swift
//  BTProjects
//
//  Created by Hilmy Noerfatih on 08/11/23.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var appState: AppState
    @State var mainScene = 0
    var body: some View {
        NavigationStack{
            HomeView(mainScene: $mainScene)
                .environmentObject(appState)
                .environment(\.managedObjectContext, appState.persistenceController.container.viewContext)
                .tag(0)
        }
        
//        TabView(selection: $mainScene){
//            
//            LearningModuleView()
//                .environmentObject(appState)
//                .ignoresSafeArea()
//                .tag(1)
//        }
//        .ignoresSafeArea()
//        .tabViewStyle(.page(indexDisplayMode: .never))
//        .animation(.easeInOut, value: mainScene)
            
    }
}

#Preview {
    ContentView()
        .environmentObject(AppState())
}
