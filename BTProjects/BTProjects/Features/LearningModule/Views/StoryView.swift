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
        VStack(spacing:0){
            // Use ForEach to loop through the data array
            ZStack {
                Background(viewState: viewState, illustration: storyPage.illustration ?? "illust_dummy")
                
                VStack(spacing:0){
                    
                    Header(isMenu: $isMenu, headerState: viewState)
                        .padding(.bottom, 80)
                    
                    StoryVideo(videoURL: storyPage.signLanguage ?? "dummy")
                        .offset(x: 330, y: 0)
                    
                    Spacer()
                }
                .padding(38)
                VStack(spacing:0){
                    
                    Spacer()
                    Footer(footerState: viewState, isDisabled: $isDisabled, bookScene: $bookScene, words: storyPage.name ?? "", highlightWord: storyPage.desc ?? "", maxBookScene: maxBookScene)
                }
                .padding(.horizontal,38)
                //add 10
                .padding(.vertical,48)
            } // Explicitly specify a unique identifier
        }
    }
}



