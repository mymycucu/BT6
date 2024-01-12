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
            VStack(spacing:10){
                Header(isMenu: $isMenu, isExitState: $isExitState, headerState: viewState)
                
                Spacer()
                
                Text(book.word?.name ?? Constant.defaultWordString)
                    .foregroundStyle(.white)
                    .font(.Heading1_Semibold)
                    .underline()
                    
                
                SummaryVideo(
                    isDisabled: $isDisabled,
                    book: book, videoURL: videoURL)
                .aspectRatio(6.2/4.3, contentMode: .fit)
                .frame(minWidth: 558, maxWidth: 744, minHeight: 337, maxHeight: 516)
                .padding(.top, 30)
                    
                
                Spacer()
                Footer(footerState: viewState, isDisabled: $isDisabled, bookScene: $bookScene, maxBookScene: maxBookScene)
            }
            .padding(.horizontal,40)
            .padding(.top)
            
            if isExitState{
                ExitState(isExitState: $isExitState)
            }
        }
        .background(
            //MARK: Background
            Background(viewState: viewState, illustration: book.word?.illustration ?? Constant.defaultIllustration)
        )
        .onAppear {
            isDisabled = !book.isRead
        }
    }
}
