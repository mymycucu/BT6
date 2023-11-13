//
//  MultipleChoiceAnswers.swift
//  BTProjects
//
//  Created by Ario Syahputra on 09/11/23.
//

import SwiftUI

struct MultipleChoiceAnswers: View {
    var answers: [String]
    var correctAnswer: String
    var multipleChoiceIllustration: String
    @Binding var selectedAnswer: Int?
    
    @State var isCorrect: Bool = false

    var body: some View {
        HStack {
            ForEach(0..<answers.count) { index in
                MultipleCardChoice(
                    imageTitle: multipleChoiceIllustration,
                    isSelected: Binding(
                        get: { selectedAnswer == index },
                        set: { newValue in
                            selectedAnswer = newValue ? index : nil
                        }
                    ),
                    correctAnswer: answers[index] == correctAnswer
                )
                .padding(.horizontal, 8)
                .onTapGesture {
                    selectedAnswer = index
                    isCorrect = answers[index] == correctAnswer
                    
                    
                }
                .disabled(isCorrect)
            }
        }
    }
}

//#Preview {
//    MultipleChoiceAnswers()
//}
