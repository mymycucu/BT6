//
//  MultipleChoiceView.swift
//  BTProjects
//
//  Created by Ario Syahputra on 09/11/23.
//

import SwiftUI

struct MultipleChoiceView: View {
    var question: Question
    
//    // Custom Identifiable struct for your data
//    struct MultipleChoiceData: Identifiable {
//        let id = UUID()
//        let multipleChoiceIllustration: String
//        let multipleChoiceSL: String
//        let question: String
//        let answers: [String] // Define answers as an array of strings
//        let correctAnswer: String
//    }
//    
//    
//    
//    let dataArray: [MultipleChoiceData] = [ MultipleChoiceData(multipleChoiceIllustration: "story_dummy", multipleChoiceSL: "dummy", question: "Apa yang harus kamu lakukan?", answers: ["bermain", "belajar"], correctAnswer: "belajar")]
//    
    
    
    var body: some View {
        ZStack {
            
            MultipleChoiceBackground()
            
            VStack {
                MultipleChoiceTopBar()
                    .padding(.horizontal, 30)
                    .padding(.top, 50)
                VStack {
                    HStack {
                        MultipleChoiceVideo(videoURL: question.signLanguage ?? Constant.defaultSignLanguage)
                            .padding()
                        
                        MultipleChoiceImage(illustration: question.illustration ?? Constant.defaultIllustration)
                        
                    }
                    MultipleChoiceQuestion(question: question.name ?? Constant.containerName)
                    
                    MultipleChoiceAnswers(question: question)
                }
                
                
                
                
                MultipleChoiceBottomBar()
                    .padding(.horizontal, 30)
                    .padding(.bottom, 30)
                
            }
        }
    }
}

//#Preview {
//    MultipleChoiceView()
//}
