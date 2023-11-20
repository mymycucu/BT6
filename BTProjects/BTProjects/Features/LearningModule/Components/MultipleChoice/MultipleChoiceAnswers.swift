//
//  MultipleChoiceAnswers.swift
//  BTProjects
//
//  Created by Ario Syahputra on 09/11/23.
//

import SwiftUI

struct MultipleChoiceAnswers: View {
    var question: Question
    @State var selectedAnswer: Int? = nil
    @State var isCorrect: Bool = false
    @Binding var isCorrectState:Bool

    var body: some View {
        HStack {
            ForEach(0..<question.lstAnswers.count) { index in
                MultipleCardChoice(
                    imageTitle: question.lstAnswers[index].illustration ?? Constant.defaultIllustration,
                    isSelected: Binding(
                        get: { selectedAnswer == index },
                        set: { newValue in
                            selectedAnswer = newValue ? index : nil
                        }
                    ),
                    correctAnswer: question.lstAnswers[index].isCorrect
                )
                .padding(.horizontal, 8)
                .onTapGesture {
                    selectedAnswer = index
                    isCorrect = question.lstAnswers[index].isCorrect
                    if isCorrect{
                        isCorrectState = true
                        QuizViewModel().updateQuestionIsDone(question: question)
                    }
                }
                .disabled(isCorrect)
            }
        }
    }
}

//#Preview {
//    MultipleChoiceAnswers()
//}
