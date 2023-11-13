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
    
    //MARK: Header Binding
    @Binding var isMenu: Bool
    @Binding var bookScene: Int
    var maxBookScene: Int
    @State var isDisabled: Bool = false
    
    @State var viewState: ViewState = .quiz
    var currentQuiz: Int
    var totalQuiz: Int

    
    var body: some View {
        ZStack {
            
            Background(viewState: $viewState)
            
            // Use ForEach to loop through the data array
            VStack {
                
                Header(isMenu: $isMenu, headerState: $viewState, currentQuiz: currentQuiz, totalQuiz: totalQuiz)

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
                Spacer()
                
            }
            .padding(38)
            
            VStack{
                
                Spacer()
                Footer(footerState: $viewState, isDisabled: $isDisabled, bookScene: $bookScene, maxBookScene: maxBookScene)
            }
            .padding(38)
        }
    }
}




