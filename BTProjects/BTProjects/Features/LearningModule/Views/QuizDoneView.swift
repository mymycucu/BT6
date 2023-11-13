//
//  QuizDone.swift
//  BTProjects
//
//  Created by Ario Syahputra on 13/11/23.
//

import SwiftUI

struct QuizDoneView: View {
    var body: some View {
        ZStack {
            
            QuizDoneBackground()
            
            VStack {
                QuizDoneContent()
                
                QuizDoneButtons()
                    .padding(.top, 50)
            }
            
        }
    }
}

#Preview {
    QuizDoneView()
}
