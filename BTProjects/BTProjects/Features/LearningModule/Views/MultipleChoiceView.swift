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
    

    
    // let dataArray: [MultipleChoiceData] = [ MultipleChoiceData(multipleChoiceIllustration: "story_dummy", multipleChoiceSL: "dummy", question: "Apa yang harus kamu lakukan?", answers: ["bermain", "belajar"], correctAnswer: "belajar")]
    

    // @State private var selectedAnswer: Int?

    // //MARK: Header Binding
    @Binding var isMenu: Bool
    @Binding var bookScene: Int
    var maxBookScene: Int
    
    @State var isDisabled: Bool = false
    
    @State var viewState: ViewState = .quiz
    var currentQuiz: Int
    var totalQuiz: Int
    
    var body: some View {
        ZStack {
            
            Background(viewState: viewState)
            
            VStack {
                Header(isMenu: $isMenu, headerState: viewState, currentQuiz: currentQuiz, totalQuiz: totalQuiz)

                Spacer()
                VStack {
                    HStack {
                        MultipleChoiceVideo(videoURL: question.signLanguage ?? Constant.defaultSignLanguage)
                            .padding()
                        
                        MultipleChoiceImage(illustration: question.illustration ?? Constant.defaultIllustration)
                        
                    }
                    MultipleChoiceQuestion(question: question.name ?? Constant.containerName)
                    
                    MultipleChoiceAnswers(question: question)
                }

                Spacer()

                
            }
            .padding(.horizontal,38)
            .padding(.vertical,36)
            
            VStack{
                
                Spacer()
                Footer(footerState: viewState, isDisabled: $isDisabled, bookScene: $bookScene, maxBookScene: maxBookScene)
            }
            .padding(38)
//            .padding(.horizontal,27)
//            .padding(.vertical,36)
        }
    }
}

//#Preview {
//    MultipleChoiceView()
//}
