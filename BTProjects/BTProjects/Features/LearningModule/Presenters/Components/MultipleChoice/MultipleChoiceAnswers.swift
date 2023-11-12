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

    var body: some View {
        HStack {
            ForEach(0..<answers.count) { index in
                MultipleCardChoice(
                    imageTitle: multipleChoiceIllustration,
                    isSelected: selectedAnswer == index,
                    onTap: {
                        // Handle button tap, set selected answer
                        selectedAnswer = selectedAnswer == index ? nil : index
                        
                        // Print feedback
                        if let selectedAnswer = selectedAnswer {
                            if answers[selectedAnswer] == correctAnswer {
                                print("Correct!")
                            } else {
                                print("Wrong! The correct answer is \(correctAnswer)")
                            }
                        }
                    },
                    correctAnswer: answers[index] == correctAnswer
                )
                .padding(.horizontal, 5)
            }
        }
    }
}

//#Preview {
//    MultipleChoiceAnswers()
//}
