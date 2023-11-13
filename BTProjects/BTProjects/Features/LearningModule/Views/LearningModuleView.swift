////
////  ContentView.swift
////  BTProjects
////
////  Created by Hilmy Noerfatih on 21/10/23.
////
//
//import SwiftUI
//import ARKit
//
//struct LearningModuleView: View {
////    @EnvironmentObject var appState: AppState
//    var book: Book
//    @State var isSearching = false
//    @State var bookScene = 2
//    
//    var body: some View {
//        ZStack{
//            
//            VStack {
////                Text(appState.book.name ?? "null")
//                TabView(selection: $bookScene){
//                    ForEach(0..<book.story.count-1, id: \.self){ idx in
//                        StoryView(isMenu: .constant(false))
//                            .ignoresSafeArea()
//                            .highPriorityGesture(DragGesture())
//                            .tag(idx)
//                    }
//                    
////                    StoryView()StoryView()
////                    .ignoresSafeArea()
////                    .highPriorityGesture(DragGesture())
////                    .tag(0)
////                        .ignoresSafeArea()
////                        .highPriorityGesture(DragGesture())
////                        .tag(0)
////                    TirukanView()
////                        .highPriorityGesture(DragGesture())
////                        .tag(1)
////                    MultipleChoiceView()
////                        .highPriorityGesture(DragGesture())
////                        .tag(2)
////                    TripleChoiceView()
////                        .highPriorityGesture(DragGesture())
////                        .tag(3)
//                    
//                }
//                .ignoresSafeArea()
//                .tabViewStyle(.page(indexDisplayMode: .never))
//            }
//        }
//        
//    }
//}
//
////#Preview {
////    LearningModuleView()
////}
