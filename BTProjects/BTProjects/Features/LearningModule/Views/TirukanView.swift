//
//  TirukanView.swift
//  BTProjects
//
//  Created by Ario Syahputra on 07/11/23.
//

import SwiftUI

struct TirukanView: View {
    @State private var isOverlayVisible = false
    var kata: Word

    @Binding var isMenu: Bool
    @State var isExitState: Bool = false
    @Binding var bookScene: Int
    var maxBookScene: Int
    @State var viewState: ViewState = .quiz
    var currentQuiz: Int
    var totalQuiz: Int
    @State var isDisabled: Bool = false
    
    @Binding var isQuestionDone:Bool
    
    var body: some View {
        ZStack {
            Background(viewState: viewState)

            VStack {
                Header(isMenu: $isMenu, isExitState: $isExitState, headerState: viewState, currentQuiz: currentQuiz, totalQuiz: totalQuiz)
                
                TirukanText(kata: kata.name ?? "")
                
                Spacer()
                
                HStack {
                    // MARK: Sign language video
                    TirukanVideo(videoURL: kata.signLanguage ?? "")
                        .padding()
                    
                    // MARK: Sign language video capture
                    TirukanCamera()
                }
                
                Spacer()
                    .frame(maxHeight: .infinity)

            }
            .padding(.horizontal,38)
            .padding(.vertical,36)
            
            VStack{
                Spacer()
                Footer(footerState: viewState, isDisabled: $isDisabled, bookScene: $bookScene, maxBookScene: maxBookScene)
            }
            .padding(38)
            
            if isExitState {
                ExitState(isExitState: $isExitState)
            }
        }
        .overlay(
                isOverlayVisible ?
                    VStack {
                        TirukanCorrect()
                            .onTapGesture {
                                withAnimation {
                                    isOverlayVisible = false
                                }
                            }
                    }
                    .background(Color.clear)
                    .opacity(isOverlayVisible ? 1.0 : 0.0) // Fade-in animation
                    .scaleEffect(isOverlayVisible ? 1.0 : 0.5) // Scale animation
                    .animation(.spring()) // You can customize the animation type
                    : nil
            )
    }
}


// #Preview {
//     TirukanView(isMenu: .constant(false))
// }


