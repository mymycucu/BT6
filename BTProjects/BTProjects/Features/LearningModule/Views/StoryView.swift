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
    @State var isDisabled: Bool = true
    @State var viewState: ViewState = .story
    
    var body: some View {
        ZStack {
            VStack(spacing:20){
                Header(isMenu: $isMenu, isExitState: $isExitState, headerState: viewState)
                Spacer()
                VStack(alignment: .trailing, spacing:0){
                    HStack{
                        Spacer()
                        StoryVideo(storyPage: storyPage, videoURL: storyPage.signLanguage ?? "", isDisabled: $isDisabled)
                            .frame(minWidth: 300, maxWidth: 366, minHeight: 300, maxHeight: 486)
                            .aspectRatio(3/4, contentMode: .fit)
                    }
                    .padding(.horizontal,70)
                    
                }
                Spacer()
                Footer(footerState: viewState, bookScene: $bookScene, isDisabled: $isDisabled, words: storyPage.name ?? "", highlightWord: storyPage.desc ?? "", maxBookScene: maxBookScene)
                    .padding(.top, 40)
                
            }
            .padding(40)
            
            
            if isExitState{
                ExitState(isExitState: $isExitState)
            }
            
        }
        .background(
            Background(viewState: viewState, illustration: storyPage.illustration ?? "illust_dummy")
        )
        .onAppear {
            isDisabled = !storyPage.isRead
        }
    }
}
