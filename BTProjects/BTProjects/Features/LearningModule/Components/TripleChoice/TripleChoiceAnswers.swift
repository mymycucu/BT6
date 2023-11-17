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
    
    @State var count: Int = 0
    
//    @State var allCorrectIndex: [Int] = []
    

    var body: some View {
        HStack {
            ForEach(0..<answers.count) { index in
                TripleCardChoice(
                    imageTitle: tripleChoiceIllustration,
                    isSelected: Binding(
                        get: { selectedAnswer == index },
                        set: { newValue in
                            selectedAnswer = newValue ? index : nil
                            
                        }), 
                    correctAnswer: Binding(
                            get: { correctAnswer.contains(answers[index])},
                            set: { newValue in
                                selectedAnswer = newValue ? index : nil
                                
                            }
                        )
                        
                        
                )
                .padding(.horizontal, 8)
                .onTapGesture{
                    if count < 2 {
                        selectedAnswer = index
                        if correctAnswer.contains(answers[index]){
                            count += 1
                        }
                    }
                }
                
                
            }
        }
    }
    
    
//    func gotAllCorrectAnswers(correctAnswers: [String], answers: [String] ){
//        
//    }
}




#Preview {
    TripleChoiceView(isMenu: .constant(false), bookScene: .constant(5), maxBookScene: 3, currentQuiz: 2, totalQuiz: 12)
}
