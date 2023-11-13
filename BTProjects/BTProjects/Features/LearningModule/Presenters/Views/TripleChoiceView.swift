//
//  TripleChoiceView.swift
//  BTProjects
//
//  Created by Ario Syahputra on 10/11/23.
//

import SwiftUI

struct TripleChoiceView: View {
    
    // Custom Identifiable struct for your data
        struct TripleChoiceData: Identifiable {
            let id = UUID()
            let tripleChoiceIllustration: String
            let tripleChoiceSL: String
            let question: String
            let answers: [String] // Define answers as an array of strings
            let correctAnswer: [String]
        }
    

    let dataArray: [TripleChoiceData] = [ TripleChoiceData(tripleChoiceIllustration: "story_dummy", tripleChoiceSL: "dummy", question: "Pilih gambar di bawah yang menunjukkan hal berbahaya?", answers: ["bermain", "belajar", "bekerja"], correctAnswer: ["belajar", "bermain"])]
    

    @State private var selectedAnswer: Int?
    


    
    var body: some View {
        ZStack {
            
            TripleChoiceBackground()
            
            // Use ForEach to loop through the data array
            
            VStack {
                
                TripleChoiceTopBar()
                    .padding(.horizontal, 30)
                    .padding(.top, 50)

                ForEach(dataArray) { data in
                    
                    VStack {
                        
                        
                        HStack {
                            TripleChoiceVideo(videoURL: data.tripleChoiceSL)
                                .padding()
                                .padding(.leading, 30)
                            
                            VStack {
                                TripleChoiceQuestion(question: data.question)
                                    .padding(.bottom, 10)
                            }
                            
                        }
                        
                        
                        TripleChoiceAnswers(answers: data.answers, correctAnswer: data.correctAnswer, tripleChoiceIllustration: data.tripleChoiceIllustration, selectedAnswer: $selectedAnswer)
                            .padding(.top, 30)

                            


                    }
                    .id(data.id) // Explicitly specify a unique identifier
                }

                
                
                TripleChoiceBottomBar()
                    .padding(.horizontal, 30)
                    .padding(.bottom, 30)
                
            }
        }
    }
}

#Preview {
    TripleChoiceView()
}

