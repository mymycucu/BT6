//
//  MultipleChoiceView.swift
//  BTProjects
//
//  Created by Ario Syahputra on 09/11/23.
//

import SwiftUI

struct MultipleChoiceView: View {
    var question: Question

    // //MARK: Header Binding
    @Binding var isMenu: Bool
    @Binding var bookScene: Int
    var maxBookScene: Int
    
    @State var isDisabled: Bool = false
    
    @State var viewState: ViewState = .quiz
    var currentQuiz: Int
    var totalQuiz: Int
    
    /// show correct state
    @State var isCorrectState: Bool = false
    @State var isExitState: Bool = false
    
    var body: some View {
        ZStack {
            
            Background(viewState: viewState)
            
            VStack {
                Header(isMenu: $isMenu, isExitState: $isExitState, headerState: viewState, currentQuiz: currentQuiz, totalQuiz: totalQuiz)

                Spacer()
                VStack {
                    HStack {
                        MultipleChoiceVideo(videoURL: question.signLanguage ?? Constant.defaultSignLanguage)
                            .padding()
                        
                        MultipleChoiceImage(illustration: question.illustration ?? Constant.defaultIllustration)
                        
                    }
                    MultipleChoiceQuestion(question: question.name ?? Constant.containerName)
                    
                    MultipleChoiceAnswers(question: question, isCorrectState: $isCorrectState)
                }

                Spacer()

                
            }
            .padding(.horizontal,38)
            .padding(.vertical,36)
            
            VStack{
                
                Spacer()
                Footer(footerState: viewState, isDisabled: $isDisabled, bookScene: $bookScene, maxBookScene: maxBookScene)
            }
            .padding(38)
//            .padding(.horizontal,27)
//            .padding(.vertical,36)
            
            if isCorrectState {
                CorrectState(isCorrectState: $isCorrectState)
            }
            if isExitState{
                ExitState(isExitState: $isExitState)
            }
        }
    }
}
