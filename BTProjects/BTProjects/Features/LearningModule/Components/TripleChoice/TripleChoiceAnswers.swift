//
//  TripleChoiceAnswers.swift
//  BTProjects
//
//  Created by Ario Syahputra on 10/11/23.
//

import SwiftUI

struct TripleChoiceAnswers: View {
    var question: Question
    @State var selectedAnswer: Int? = nil
    @State var count: Int = 0
    
    @Binding var isCorrectState:Bool
    @State var questionChoosen:[Bool]
    
    @Binding var isQuestionDone: Bool
    
    init(question: Question, isCorrectState: Binding<Bool>, isQuestionDone: Binding<Bool>) {
        self.question = question
        self.selectedAnswer = nil
        self.count = 0
        _isCorrectState = isCorrectState
        self.questionChoosen = [Bool](repeating: false, count: question.lstAnswers.count)
        _isQuestionDone = isQuestionDone
    }
    
    var body: some View {
        HStack {
            ForEach(0..<question.lstAnswers.count) { index in
                TripleCardChoice(
                    imageTitle: question.lstAnswers[index].illustration ?? Constant.defaultIllustration,
                    isSelected: Binding(
                        get: { selectedAnswer == index },
                        set: { newValue in
                            selectedAnswer = newValue ? index : nil
                        }), 
                    correctAnswer: Binding(
                        get: { question.lstAnswers[index].isCorrect},
                        set: { newValue in
                            selectedAnswer = newValue ? index : nil
                        }),
                    isQuestionDone: $isQuestionDone
                )
                .padding(.horizontal, 8)
                .onTapGesture{
                    if count < 2 {
                        selectedAnswer = index
                        if question.lstAnswers[index].isCorrect == true && !questionChoosen[index]{
                            questionChoosen[index] = true
                            count += 1
                            if count == 2 {
                                isCorrectState = true
                                QuizViewModel().updateQuestionIsDone(question: question)
                            }
                        }
                    }
                }
            }
        }
    }
}




//#Preview {
//    TripleChoiceView(question: <#Question#>, isMenu: .constant(false), bookScene: .constant(5), maxBookScene: 3, currentQuiz: 2, totalQuiz: 12)
//}
