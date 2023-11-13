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
    var book: Book
    
    var body: some View {
        ZStack{
            if (bookScene == 0){
                BookCoverView(bookScene: $bookScene, book: book)
            }
            ForEach(0..<book.story.count, id: \.self){ idx in
                if(bookScene == idx+1){
                    StoryView(isMenu: $isMenu, bookScene: $bookScene, storyPage: book.story[idx])
                        .ignoresSafeArea()
                }
            }
            if (bookScene == book.story.count+1){
                WordSummary()
            }
            
            ForEach(0..<book.lstQuestions.count, id: \.self){ idx in
                if(bookScene == idx+book.story.count+2){
                    switch book.lstQuestions[idx].type {
                    case 0:
                        TirukanView(kata: book.word?.name ?? Constant.defaultTirukanString)
                    case 1:
                        MultipleChoiceView(question: book.lstQuestions[idx])
                    case 2:
                        TripleChoiceView()
                    case 3:
                        ConnectImages()
                    default:
                        TirukanView(kata: book.word?.name ?? Constant.defaultTirukanString)
                    }
                }
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
