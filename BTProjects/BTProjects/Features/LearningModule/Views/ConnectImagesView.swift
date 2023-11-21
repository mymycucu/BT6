//
//  ConnectImages.swift
//  BTProjects
//
//  Created by Sarah Uli Octavia on 08/11/23.
//

import SwiftUI


struct imagePosition: Identifiable, Equatable  {
    var id: Int
    var position: CGPoint
    var isCorrect: Bool?
}


struct ConnectImagesView: View {
    var question: Question
    
    //MARK: Header Binding
    @Binding var isMenu: Bool
    @Binding var bookScene: Int
    var maxBookScene: Int
    
    @State var isDisabled: Bool = true
    
    @State var viewState: ViewState = .quiz
    @State var currentQuiz: Int = 8
    @State var totalQuiz: Int = 8
    
    
    /// show correct state
    @State var isCorrectState: Bool = false
    @State var isExitState: Bool = false
    @State var isQuestion: Bool = true
    
    /// state correct stay
    @Binding var isQuestionDone:Bool
    
    var body: some View {
        
        ZStack {
            //MARK: Background
            Background(viewState: viewState)
            
            //MARK: Quiz Header
            VStack{
                Header(isMenu: $isMenu, isExitState: $isExitState, headerState: viewState, currentQuiz: currentQuiz, totalQuiz: totalQuiz)
                Spacer()
            }
            .padding(.horizontal,38)
            .padding(.vertical,36)
           
            ConnectImagesAnswers(question: question,  isCorrectState: $isCorrectState, isQuestionDone: $isQuestionDone)
            
            //MARK: Footer
            VStack(spacing: 0){
                HStack {
                    Spacer()
                    
                    //MARK: X Button
                    Button(action: {
                        isQuestion.toggle()
                    }) {
                        
                        HStack(alignment: .center, spacing: 0) {
                            Image(systemName: "questionmark")
                                .bold()
                                .imageScale(.large)
                                .foregroundColor(Color.PB500)
                            
                        }
                        .frame(width: 52, height: 52)
                        .background(Color.white)
                        .cornerRadius(100)
                        .overlay(
                            RoundedRectangle(cornerRadius: 100)
                                .inset(by: 1)
                                .stroke(Color.PB500, lineWidth: 3)
                        )
                        
                        
                    }
                    
                    
                }
                .padding(.top, 100)
                Spacer()
                Footer(footerState: viewState, isDisabled: $isDisabled, bookScene: $bookScene, maxBookScene: maxBookScene)
            }
            .padding(38)
            
            if isCorrectState {
                CorrectState(isCorrectState: $isCorrectState, isDisabled: $isDisabled)
                
                    .onAppear{
                        isQuestionDone = true
                    }
            }
            if isExitState{
                ExitState(isExitState: $isExitState)
            }
            if isQuestion{
                ConnectImagesQuestion(isQuestion: $isQuestion)
            }
            
            
        }
        //MARK: OnAppear
        .onAppear{
            if isQuestionDone {
                isDisabled = false
            }
        }
        
    }
    
    
}



