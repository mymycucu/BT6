//
//  TirukanView.swift
//  BTProjects
//
//  Created by Ario Syahputra on 07/11/23.
//

import SwiftUI

struct TirukanView: View {
    @State private var isOverlayVisible = false
    
    @Binding var isMenu: Bool
    @State var viewState: ViewState = .quiz
    @State var currentQuiz: Int = 1
    @State var totalQuiz: Int = 8
    @State var isDisabled: Bool = false
    
    var body: some View {
        ZStack {
            Background(viewState: $viewState)

            VStack {
                
                Header(isMenu: $isMenu, headerState: $viewState, currentQuiz: $currentQuiz, totalQuiz: $totalQuiz)

                TirukanText()
                
                Spacer()
                
                HStack {
                    // MARK: Sign language video
                    TirukanVideo()
                        .padding()
                    
                    // MARK: Sign language video capture
                    TirukanCamera()
                }
                
                Spacer()
                
//                TirukanBottomBar(isOverlayVisible: $isOverlayVisible)
                Footer(footerState: $viewState, isDisabled: $isDisabled)
                
            }
            .padding(38)
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


#Preview {
    TirukanView(isMenu: .constant(false))
}


