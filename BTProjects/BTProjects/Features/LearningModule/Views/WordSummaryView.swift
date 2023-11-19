//
//  WordSummaryView.swift
//  BTProjects
//
//  Created by Sarah Uli Octavia on 13/11/23.
//

import SwiftUI

struct WordSummaryView: View {
    @Binding var isMenu: Bool
    @State var isExitState: Bool = false
    @Binding var bookScene: Int
    var maxBookScene: Int
    var word: String
    var videoURL: String
    
    @State var viewState: ViewState = .summary
    @State var background: String = "background-word-summary"
    @State var isDisabled: Bool = true
    
    @State var countVideoPlayed: Int = 0

    
    var body: some View {
        ZStack{
            //MARK: Background
            Background(viewState: viewState, illustration: background)
            
            VStack(spacing: 0){
                Header(isMenu: $isMenu, isExitState: $isExitState, headerState: viewState)
                
                Spacer()
                
                Text(word)
                    .foregroundStyle(.white)
                    .font(.Heading1_Semibold)
                    .underline()
                    .padding(.bottom, 50)
                
                SummaryVideo(videoURL: videoURL, countVideoPlayed: $countVideoPlayed)
                    
                
                Spacer()
                    .frame(maxHeight: .infinity)
                
            }
            .padding(.horizontal,38)
            .padding(.vertical,36)
            
            
            
            VStack(spacing: 0){
                Spacer()
                
                Footer(footerState: viewState, bookScene: $bookScene, countVideoPlayed: $countVideoPlayed, maxBookScene: maxBookScene)
                
            }
            .padding(38)
//                .padding(.vertical,35)
            
            if isExitState{
                ExitState(isExitState: $isExitState)
            }
        }
    }
}
