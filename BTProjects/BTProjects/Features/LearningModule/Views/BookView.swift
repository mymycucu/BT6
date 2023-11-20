//
//  BookView.swift
//  BTProjects
//
//  Created by Hilmy Noerfatih on 13/11/23.
//

import SwiftUI

struct BookView: View {
    @State var bookScene: Int = 0
    @State var isMenu: Bool = false
    @State private var countPageOne: Int = 0
    
    var book: Book
    
    var body: some View {
        ZStack{
            if (bookScene == 0){
                BookCoverView(bookScene: $bookScene, book: book)
            }
            ForEach(0..<book.story.count, id: \.self){ idx in
                if(bookScene == idx+1){
                    if bookScene == 1 {
                        if countPageOne == 0 {
                            StoryView(isMenu: $isMenu, bookScene: $bookScene, maxBookScene: book.lstQuestions.count+book.story.count+3, storyPage: book.story[idx])
                                .ignoresSafeArea()
                                .transition(.moveAndFade)
                                .animation(.default)
                                .background(Background(viewState: .normal))
                        } else {
                            StoryView(isMenu: $isMenu, bookScene: $bookScene, maxBookScene: book.lstQuestions.count+book.story.count+3, storyPage: book.story[idx])
                                .ignoresSafeArea()
                        }
                    }else{
                        
                        StoryView(isMenu: $isMenu, bookScene: $bookScene, maxBookScene: book.lstQuestions.count+book.story.count+3, storyPage: book.story[idx])
                            .ignoresSafeArea()
                            .onAppear{
                                countPageOne += 1
                            }
                    }
                    
                        
                }
            }
            if (bookScene == book.story.count+1){
                WordSummaryView(isMenu: $isMenu,bookScene: $bookScene, maxBookScene: book.lstQuestions.count+book.story.count+3, book: book, videoURL: book.summarySignLanguage ?? Constant.defaultSignLanguage)
            }
            
            ForEach(0..<book.lstQuestions.count, id: \.self){ idx in
                if(bookScene == idx+book.story.count+2){
                    switch book.lstQuestions[idx].type {
                    case 0:
                        TirukanView(kata: book.word!, isMenu: $isMenu, bookScene: $bookScene, maxBookScene: book.lstQuestions.count+book.story.count+3, currentQuiz: idx+1, totalQuiz: book.lstQuestions.count+1)
                    case 1:
                        MultipleChoiceView(question: book.lstQuestions[idx], isMenu: $isMenu, bookScene: $bookScene, maxBookScene: book.lstQuestions.count+book.story.count+3, currentQuiz: idx+1, totalQuiz: book.lstQuestions.count+1)
                    case 2:
                        TripleChoiceView(question: book.lstQuestions[idx], isMenu: $isMenu, bookScene: $bookScene, maxBookScene: book.lstQuestions.count+book.story.count+3, currentQuiz: idx+1, totalQuiz: book.lstQuestions.count)
                    case 3:
                        ConnectImagesView(question: book.lstQuestions[idx], isMenu: $isMenu, bookScene: $bookScene, maxBookScene: book.lstQuestions.count+book.story.count+3)
                    default:
                        TirukanView(kata: book.word!, isMenu: $isMenu,bookScene: $bookScene, maxBookScene: book.lstQuestions.count+book.story.count+3, currentQuiz: idx, totalQuiz: book.lstQuestions.count)
                    }
                }
            }
            
            if (bookScene == book.story.count+book.lstQuestions.count+2){
                QuizDoneView(bookScene: $bookScene, maxBookScene: book.story.count+book.lstQuestions.count+3)
                    .ignoresSafeArea()
            }
            
            
            if isMenu{
                MenuView(isMenu: $isMenu, bookScene: $bookScene, book: book)
            }
        }
        
    }
}


//#Preview {
//    BookView()
//}
