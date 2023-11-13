//
//  MenuView.swift
//  BTProjects
//
//  Created by Sarah Uli Octavia on 12/11/23.
//

import SwiftUI

struct StoryCover: Identifiable {
      let id = UUID()
    var storyThumbnail: String
  }

struct QuestionCover: Identifiable {
      let id = UUID()
      let storyThumbnail: String
  }

struct MenuView: View {
    @Binding var isMenu : Bool
    
    @State var isSelectStory: Int?
    @State var isSelectQuestion: Int?
    private let columns: [GridItem] = [
        GridItem(.fixed(316), spacing: 24, alignment: .center),
        GridItem(.fixed(316), spacing: 24, alignment: .center)
    ]
    
    @State var dataStory: [StoryCover] = [
     StoryCover(storyThumbnail: "mencari-kumbang"),
     StoryCover(storyThumbnail: "background-word-summary"),
     StoryCover(storyThumbnail: "mencari-kumbang"),
    ]
    @State var dataQuestion: [QuestionCover] = [
     QuestionCover(storyThumbnail: "mencari-kumbang"),
     QuestionCover(storyThumbnail: "background-word-summary"),
     QuestionCover(storyThumbnail: "mencari-kumbang"),
     QuestionCover(storyThumbnail: "background-word-summary")
    ]
    
    
    var body: some View {
        ZStack (alignment: Alignment(horizontal: .trailing, vertical: .top), content: {
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 20) {
                    VStack(spacing: 32) {
                        LazyVGrid (columns: columns, spacing: 32, content: {
                            
                            //MARK: StoryPage
                            Section(header: Text("Stories")
                                .font(.Heading2_Semibold)
                                .foregroundColor(.white))
                            {
                
                                ForEach(0..<dataStory.count, id: \.self) { item in
                                    let imageTitle = dataStory[item].storyThumbnail
                                    Button(action: {
                                        isSelectStory = item
                                        isSelectQuestion = nil
                                    }, label: {
                                        ThumbnailPage(isSelect: $isSelectStory, order: item + 1, imageTitle: imageTitle )
                                    })
                                }
                            }
                            
                            //MARK: Question
                            Section(header:
                                        Text("Question")
                                .font(.Heading2_Semibold)
                                .foregroundColor(.white))
                            {
                                ForEach(0..<dataQuestion.count, id: \.self) { item in
                                    let imageTitle = dataQuestion[item].storyThumbnail
                                    Button(action: {
                                        isSelectQuestion = item
                                        isSelectStory = nil
                                    }, label: {
                                        ThumbnailPage(isSelect: $isSelectQuestion, order: item + 1, imageTitle: imageTitle )
                                    })
                                }
                                
                            }
                        })
                    }
                    
                }
                .padding(.vertical, 25)
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
            .padding()
            
        })
        
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding(.top, 43)
        .background(
            Color.primary.opacity(0.7)
        )
        .animation(.easeInOut, value: isMenu)
    }
}

#Preview {
    MenuView(isMenu: .constant(true))
}
