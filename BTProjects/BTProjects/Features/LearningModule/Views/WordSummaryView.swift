//
//  WordSummaryView.swift
//  BTProjects
//
//  Created by Sarah Uli Octavia on 13/11/23.
//

import SwiftUI

struct WordSummaryView: View {
    @Binding var isMenu: Bool
    @Binding var bookScene: Int
    var maxBookScene: Int
    var word: String
    
    @State var viewState: ViewState = .summary
    @State var background: String = "background-word-summary"
    @State var isDisabled: Bool = false
    
    var body: some View {
        VStack {
            ZStack{
                //MARK: Background
                Background(viewState: $viewState, illustration: background)
                
                VStack(spacing: 0){
                    Header(isMenu: $isMenu, headerState: $viewState)
                        
                        
                    Text(word)
                        .foregroundStyle(.white)
                        .font(.Heading1_Semibold)
                        .underline()
                        .padding(.bottom, 50)
                    SummaryVideo()
                        
                    Spacer()
                        
                    
                }
                .padding( 38)
                
                VStack(spacing: 0){
                    Spacer()
                    
                    Footer(footerState: $viewState, isDisabled: $isDisabled, bookScene: $bookScene, maxBookScene: maxBookScene)
                    
                }
                .padding(38)
                

            }
        }
    }
}
