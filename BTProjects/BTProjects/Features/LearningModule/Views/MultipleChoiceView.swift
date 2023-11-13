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

    //MARK: Header Binding
    @Binding var isMenu: Bool
    @State var isDisabled: Bool = false
    
    @State var viewState: ViewState = .quiz
    @State var currentQuiz: Int = 4
    @State var totalQuiz: Int = 8
    
    var body: some View {
        ZStack {
            
            Background(viewState: $viewState)
            
            // Use ForEach to loop through the data array
            
            VStack(spacing:0){
                
                Header(isMenu: $isMenu, headerState: $viewState, currentQuiz: $currentQuiz, totalQuiz: $totalQuiz)
                
                Spacer()
                ForEach(dataArray) { data in
                    
                    VStack{
                        
                        
                        HStack {
                            MultipleChoiceVideo(videoURL: data.multipleChoiceSL)
                                .padding()
                            
                            MultipleChoiceImage(illustration: data.multipleChoiceIllustration)
                            
                        }
                        
                        MultipleChoiceQuestion(question: data.question)
                            .padding(.bottom, 24)
                        
                        MultipleChoiceAnswers(answers: data.answers, correctAnswer: data.correctAnswer, multipleChoiceIllustration: data.multipleChoiceIllustration, selectedAnswer: $selectedAnswer)
                            


                    }
                    .id(data.id) // Explicitly specify a unique identifier
                }

                Spacer()
                
               
                    
                
            }
            .padding(38)
            
            VStack{
                
                Spacer()
                Footer(footerState: $viewState, isDisabled: $isDisabled)
            }
            .padding(38)
        }
    }
}

#Preview {
    MultipleChoiceView(isMenu: .constant(false))
}
