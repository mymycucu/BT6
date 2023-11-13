//
//  BookView.swift
//  BTProjects
//
//  Created by Hilmy Noerfatih on 13/11/23.
//

import SwiftUI

struct BookView: View {
    @State var bookScene: Int = 0
    var book: Book
    var body: some View {
        ForEach(0..<book.story.count-1, id: \.self){ idx in
            if(bookScene == idx){
                StoryView()
                    .ignoresSafeArea()
            }
        }
        
        
    }
}
            

//#Preview {
//    BookView()
//}
