//
//  StoryView.swift
//  BTProjects
//
//  Created by Ario Syahputra on 25/10/23.
//

import SwiftUI

struct StoryView: View {
    @Binding var isMenu: Bool
    @Binding var bookScene: Int
    var maxBookScene:Int
    var storyPage: StoryPage
    @State var isDisabled: Bool = false
    @State var viewState: ViewState = .story
    
    var body: some View {
        VStack {
            // Use ForEach to loop through the data array
//            ForEach(dataArray) { data in
                ZStack {
                    // StoryBackground(illustration: storyPage.illustration ?? "illust_dummy")
                    //     .padding(.top, 20)
                    Background(viewState: $viewState, illustration: storyPage.illustration ?? "illust_dummy")
                    
                    VStack(spacing:0){
                        
                        Header(isMenu: $isMenu, headerState: $viewState)
                        
                        Spacer()

                        StoryVideo(videoURL: storyPage.signLanguage ?? "dummy")
                            .offset(x: 330, y: 0)
                            .padding(.vertical, 80)
                        
                        Spacer()
                        Footer(footerState: $viewState, isDisabled: $isDisabled, bookScene: $bookScene, words: storyPage.name ?? "", highlightWord: storyPage.desc ?? "", maxBookScene: maxBookScene)
                    }
                    .padding(38)
                }// Explicitly specify a unique identifier
            }
//        }
    }
}

//#Preview {
//    StoryView(isMenu: .constant(false))
//}
