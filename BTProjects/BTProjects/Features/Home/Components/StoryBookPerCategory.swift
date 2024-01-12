//
//  StoryBookPerCategory.swift
//  BTProjects
//
//  Created by Sarah Uli Octavia on 06/11/23.
//

import SwiftUI

struct StoryBookPerCategory: View {
    @EnvironmentObject var appState: AppState
    var category : Category
    var disabledComingSoon: Bool = true
    
    private let columns: [GridItem] = [
        GridItem(.flexible(minimum: 205, maximum: 330), spacing: 24, alignment: .center),
        GridItem(.flexible(minimum: 205, maximum: 330), spacing: 24, alignment: .center)
    ]
    var body: some View {
        ZStack{
            LazyHGrid(
                rows: columns, spacing: 24
            ){
                
                ForEach(category.book, id: \.self){ book in
                    NavigationLink(destination: {
                        BookView(book: book).navigationBarBackButtonHidden(true)
                    }, label:{
                        StoryBook(storyThumbnail: book.thumbnail ?? "il_b_default", storyTitle: book.name ?? "bookname")
                        
                    })
                    
                    
                }
                if category.book.count < 4 {
                    let countBook = 4 - category.book.count
                    ForEach(0..<countBook, id:\.self){ index in
                        if index > 2{
                            Button {
                                
                            } label: {
                                StoryBook(storyThumbnail:  Constant.thumbnailComingSoon[0] , storyTitle:  "Segera dibuka", isComingSoon: true)
                            }
                            .disabled(disabledComingSoon)
                        } else {
                            Button {
                                
                            } label: {
                                StoryBook(storyThumbnail:  Constant.thumbnailComingSoon[index] , storyTitle:  "Segera dibuka", isComingSoon: true)
                            }
                            .disabled(disabledComingSoon)
                            
                        }
                    }
                } 

            }
        }
        .padding(15)
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.Gray6)
                .opacity(0.4)

        )
        
    }
}

//#Preview {
//    StoryBookPerCategory()
//}
