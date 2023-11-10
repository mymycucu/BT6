//
//  coreDataTestView.swift
//  BTProjects
//
//  Created by Hilmy Noerfatih on 08/11/23.
//

import SwiftUI

struct coreDataTestView: View {
    @EnvironmentObject var appState: AppState
    @FetchRequest(entity: Category.entity(), sortDescriptors: [])
    private var categories: FetchedResults<Category>
    @FetchRequest(entity: Book.entity(), sortDescriptors: [])
    private var books: FetchedResults<Book>
    
    var body: some View {
        VStack{
            Text("---")
            ForEach(books, id: \.self) { book in
                Text(book.name ?? "bookname error")
                ForEach(book.story, id: \.self) { story in
                    Text(story.name ?? "bookname error")
                }
                Text("---")
            }
            
        }
    }
}

#Preview {
    coreDataTestView()
}
