//
//  TirukanView.swift
//  BTProjects
//
//  Created by Ario Syahputra on 07/11/23.
//

import SwiftUI

struct TirukanView: View {
    @State private var isOverlayVisible = false

    var body: some View {
        ZStack {
            TirukanBackground()

            VStack {
                
                TirukanTopBar()
                    .padding(.horizontal, 30)
                    .padding(.top, 50)

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
                
                TirukanBottomBar(isOverlayVisible: $isOverlayVisible)
                    .padding(.horizontal, 30)
                    .padding(.bottom, 30)
                
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


#Preview {
    TirukanView()
}


