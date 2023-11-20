//
//  StoryCoverView.swift
//  BTProjects
//
//  Created by Ario Syahputra on 12/11/23.
//

import SwiftUI

struct BookCoverView: View {
    @Binding var bookScene: Int
    var book: Book
    @State var viewState: ViewState = .normal
//    init(bookScene: Int, book: Book, viewState: ViewState) {
//        self.bookScene = bookScene
//        self.book = book
//        self.viewState = viewState
//        self.isQuisFinished = book.lstQuestions.last!.isDone
//    }
    
    var body: some View {
        ZStack {
            
            Background(viewState: viewState)
            
            HStack {
                StoryCoverContent(
                    bookScene: $bookScene,
                    questionSceneIndex: book.story.endIndex+2,
                    storyPages: book.storyPages?.count ?? 0,
                    storyTitle: book.name ?? "book",
                    canStartQuiz: book.isRead, isQuizFinished: book.lstQuestions.last!.isDone)
                    .padding(38)
                
                    Spacer()
                    
                    // MARK: Story Button
                    Button(action: {
                        bookScene = 1
                    }) {
                        StoryCoverBook(storyThumbnail: book.cover ?? "story_cover", storyTitle: book.name ?? "book")
                        
                    }
                    .padding(.horizontal, 40)
                }
            
        }
    }
}
//
//#Preview {
//    BookCoverView(bookScene: .constant(0))
//}
