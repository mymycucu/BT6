//
//  StoryView.swift
//  BTProjects
//
//  Created by Ario Syahputra on 25/10/23.
//

import SwiftUI

struct StoryView: View {
    @Binding var isMenu: Bool
    @State var isExitState: Bool = false
    @Binding var bookScene: Int
    var maxBookScene:Int
    var storyPage: StoryPage
    @State var viewState: ViewState = .story
    
    @State var countVideoPlayed: Int = 0
    
    var body: some View {
        ZStack {
            Background(viewState: viewState, illustration: storyPage.illustration ?? "illust_dummy")
            
            VStack(spacing:0){
                
                Header(isMenu: $isMenu, isExitState: $isExitState, headerState: viewState)
                    .padding(.bottom, 80)
                
                StoryVideo(videoURL: storyPage.signLanguage ?? "", countVideoPlayed: $countVideoPlayed)
                    .offset(x: 330, y: 0)
                
                Spacer()
            }
            .padding(38)
            VStack(spacing:0){
                
                Spacer()
                Footer(footerState: viewState, bookScene: $bookScene, countVideoPlayed: $countVideoPlayed, words: storyPage.name ?? "", highlightWord: storyPage.desc ?? "", maxBookScene: maxBookScene)
            }
            .padding(38)
            
            if isExitState{
                ExitState(isExitState: $isExitState)
            }
            
        }
    }
}
