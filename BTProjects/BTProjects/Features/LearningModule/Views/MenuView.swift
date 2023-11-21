//
//  MenuView.swift
//  BTProjects
//
//  Created by Sarah Uli Octavia on 12/11/23.
//

import SwiftUI

struct MenuView: View {
    @Binding var isMenu : Bool
    @Binding var bookScene: Int
    var book: Book
    
    
    private let columns: [GridItem] = [
        GridItem(.fixed(316), spacing: 24, alignment: .center),
        GridItem(.fixed(316), spacing: 24, alignment: .center)
    ]
    
    var body: some View {
        ZStack (alignment: Alignment(horizontal: .trailing, vertical: .top), content: {
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 20) {
                    VStack(spacing: 32) {
                        LazyVGrid (columns: columns, spacing: 32, content: {
                            
                            //MARK: StoryPage
                            Section(header: 
                                Text("Stories")
                                    .font(.Heading2_Semibold)
                                    .foregroundColor(.white))
                            {
                                ForEach(0..<book.story.count, id: \.self) { idx in
                                    Button(action: {
                                        bookScene = idx+1
                                        isMenu.toggle()
                                    }, label: {
                                        ThumbnailPage(isSelect: bookScene==idx+1, order: idx+1, imageTitle: book.story[idx].illustration ?? "mencari-kumbang", isRead: idx != 0 ?  book.story[idx-1].isRead ? true : false : true)
                                    })
                                    .disabled(idx != 0 ? book.story[idx-1].isRead ? false : true : false)
                                }
                                Button(action: {
                                    bookScene = book.story.count+1
                                    isMenu.toggle()
                                }, label: {
                                    ThumbnailPage(isSelect: bookScene==book.story.count+1, order: book.story.count+1, imageTitle: book.word?.illustration ?? Constant.defaultIllustration, isRead: book.isRead )
                                })
                                .disabled(!book.isRead)
                                
                            }
                            
                            //MARK: Question
                            Section(header:
                                Text("Question")
                                    .font(.Heading2_Semibold)
                                    .foregroundColor(.white))
                            {
                                ForEach(0..<book.lstQuestions.count, id: \.self) { idx in
                                    Button(action: {
                                        bookScene = idx+book.story.count+2
                                        isMenu.toggle()
                                    }, label: {
                                        ThumbnailPage(isSelect: bookScene == idx+book.story.count+2, order: idx+1, imageTitle: book.lstQuestions[idx].illustration ?? "mencari-kumbang", isRead: (idx != 0 && idx != 1) ? book.lstQuestions[idx-1].isDone ? true : false : book.isRead)
                                    })
                                    .disabled((idx != 0 && idx != 1) ? book.lstQuestions[idx-1].isDone ? false : true : !book.isRead)
                                }
                                
                            }
                        })
                    }
                    
                }
                .padding(.vertical, 60)
                .padding(.horizontal, 30)
                .cornerRadius(25)
            }
            
            
            Button(action: {
                isMenu.toggle()
            }) {
                Image(systemName: "xmark")
                    .font(.Button)
            }
            .buttonStyle(CircularButtonStyle())
            .padding(.horizontal,35)
            .padding(.vertical,36)
            
        })
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            Color.Overlay1.opacity(0.7)
        )
        .animation(.easeInOut, value: isMenu)
    }
}

//#Preview {
//    MenuView(isMenu: .constant(true))
//}
