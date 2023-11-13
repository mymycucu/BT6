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
            ForEach(1..<book.story.count, id: \.self){ idx in
                if(bookScene == idx){
                    StoryView(isMenu: $isMenu)
                        .ignoresSafeArea()
                }
            }
            
            if isMenu{
                MenuView(isMenu: $isMenu)
            }
        }
        
    }
}


//#Preview {
//    BookView()
//}
