//
//  TripleChoiceAnswers.swift
//  BTProjects
//
//  Created by Ario Syahputra on 10/11/23.
//

import SwiftUI

struct TripleChoiceAnswers: View {
    var answers: [String]
    var correctAnswer: [String]
    var tripleChoiceIllustration: String
    @Binding var selectedAnswer: Int?
    
    @State private var isCorrect: Bool = false
    
    @State var isSelected: Bool = false
    
//    @State var allCorrectIndex: [Int] = []
    

    var body: some View {
        HStack {
            ForEach(0..<answers.count) { index in
                TripleCardChoice(
                    imageTitle: tripleChoiceIllustration,
                    correctAnswer: Binding(
                        get: { correctAnswer.contains(answers[index])},
                        set: { newValue in
                            selectedAnswer = newValue ? index : nil

                        }
                    )
                        
                        
                )
                .padding(.horizontal, 8)
//                .onAppear{
//                    allCorrectIndex.append(index)
//                }
                
                
            }
        }
    }
}




//#Preview {
//    TripleChoiceAnswers()
//}
