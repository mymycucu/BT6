//
//  QuizDone.swift
//  BTProjects
//
//  Created by Ario Syahputra on 13/11/23.
//

import SwiftUI

struct QuizDoneView: View {
    
    
    @Binding var bookScene: Int
    var maxBookScene: Int
    var viewState: ViewState = .normal
    
    var body: some View {
        ZStack {
            
            Background(viewState: viewState)
            
            VStack {
                QuizDoneContent()
                
                QuizDoneButtons(bookScene: $bookScene, maxBookScene: maxBookScene)
                    .padding(.bottom, 50)
//                    .padding(.top, 50)
            }
            
        }
    }
}

#Preview {
    QuizDoneView(bookScene: .constant(1), maxBookScene: 3)
}
