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
    
//    struct StoryCover: Identifiable {
//        let id = UUID()
//        let storyThumbnail: String
//        let storyPages: Int
//        let storyTitle: String
//        let canStartQuiz: Bool
//    }
//    
//    // Sample data array with 5 items
//    let dataArray: [StoryCover] = [
//        StoryCover(storyThumbnail: "story_cover", storyPages: 13, storyTitle: "Tolong Sarah, Bu!", canStartQuiz: false)
//    ]
    
    let isQuizFinished: Bool
    
    
    var body: some View {
        ZStack {
            
            StoryCoverBackground()
            
            HStack {
                
                    
                StoryCoverContent(storyPages: book.storyPages?.count ?? 0, storyTitle: book.name ?? "book", canStartQuiz: false, isQuizFinished: true)
                        .padding(.leading, 40)
                    
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
