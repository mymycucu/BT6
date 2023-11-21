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
    var book: Book
    var videoURL: String
    
    var viewModel = SummaryViewModel()
    @State var viewState: ViewState = .summary
    @State var background: String = "background-word-summary"
    @State var isDisabled: Bool = true

    var body: some View {
        ZStack{
            //MARK: Background
            Background(viewState: viewState, illustration: book.word?.illustration ?? Constant.defaultIllustration)
            
            VStack(spacing: 0){
                Header(isMenu: $isMenu, isExitState: $isExitState, headerState: viewState)
                
                Spacer()
                
                Text(book.word?.name ?? Constant.defaultWordString)
                    .foregroundStyle(.white)
                    .font(.Heading1_Semibold)
                    .underline()
                    .padding(.bottom, 50)
                
                SummaryVideo(
                    isDisabled: $isDisabled,
                    book: book, videoURL: videoURL)
                    
                
                Spacer()
                    .frame(maxHeight: .infinity)
                
            }
            .padding(.horizontal,38)
            .padding(.vertical,36)
            
            
            
            VStack(spacing: 0){
                Spacer()
                
                Footer(footerState: viewState, isDisabled: $isDisabled, bookScene: $bookScene, maxBookScene: maxBookScene)
            }
            .padding(38)
//                .padding(.vertical,35)
            
            if isExitState{
                ExitState(isExitState: $isExitState)
            }
        }
        .onAppear {
            isDisabled = !book.isRead
        }
    }
}
