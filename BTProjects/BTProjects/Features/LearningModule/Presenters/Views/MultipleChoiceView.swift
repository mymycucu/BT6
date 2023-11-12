//
//  MultipleChoiceView.swift
//  BTProjects
//
//  Created by Ario Syahputra on 09/11/23.
//

import SwiftUI

struct MultipleChoiceView: View {
    
    // Custom Identifiable struct for your data
        struct MultipleChoiceData: Identifiable {
            let id = UUID()
            let multipleChoiceIllustration: String
            let multipleChoiceSL: String
            let question: String
            let answers: [String] // Define answers as an array of strings
            let correctAnswer: String
        }
    

    
    let dataArray: [MultipleChoiceData] = [ MultipleChoiceData(multipleChoiceIllustration: "story_dummy", multipleChoiceSL: "dummy", question: "Apa yang harus kamu lakukan?", answers: ["bermain", "belajar"], correctAnswer: "belajar")]
    

    @State private var selectedAnswer: Int?


    
    var body: some View {
        ZStack {
            
            MultipleChoiceBackground()
            
            // Use ForEach to loop through the data array
            
            VStack {
                
                MultipleChoiceTopBar()
                    .padding(.horizontal, 30)
                    .padding(.top, 50)

                ForEach(dataArray) { data in
                    
                    VStack {
                        
                        
                        HStack {
                            MultipleChoiceVideo(videoURL: data.multipleChoiceSL)
                                .padding()
                            
                            MultipleChoiceImage(illustration: data.multipleChoiceIllustration)
                            
                        }
                        
                        MultipleChoiceQuestion(question: data.question)
                        
                        MultipleChoiceAnswers(answers: data.answers, correctAnswer: data.correctAnswer, multipleChoiceIllustration: data.multipleChoiceIllustration, selectedAnswer: $selectedAnswer)


                    }
                    .id(data.id) // Explicitly specify a unique identifier
                }

                
                
                MultipleChoiceBottomBar()
                    .padding(.horizontal, 30)
                    .padding(.bottom, 30)
                
            }
        }
    }
}

#Preview {
    MultipleChoiceView()
}
