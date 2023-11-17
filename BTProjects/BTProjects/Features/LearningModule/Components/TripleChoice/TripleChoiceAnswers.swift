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
                            
                        }
                    )
                    
                    
                )
                .padding(.horizontal, 8)
                .onTapGesture{
                    if count < 2 {
                        selectedAnswer = index
                        if question.lstAnswers[index].isCorrect == true {
                            count += 1
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
