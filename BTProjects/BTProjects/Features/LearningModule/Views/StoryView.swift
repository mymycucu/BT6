//
//  StoryView.swift
//  BTProjects
//
//  Created by Ario Syahputra on 25/10/23.
//

import SwiftUI

struct StoryView: View {
    @Binding var isMenu: Bool
    @State var isDisabled: Bool = false
    @State var viewState: ViewState = .story
    
    // Custom Identifiable struct for your data
    struct StoryData: Identifiable {
        let id = UUID()
        let illustration: String
        let signLanguage: String
        let words: String
        let highlightWord: String
    }
    
    // Sample data array with 5 items
    let dataArray: [StoryData] = [
        StoryData(illustration: "illust_dummy", signLanguage: "dummy", words: "Dino membaca buku", highlightWord: ""),
    ]
    
    var body: some View {
        VStack {
            // Use ForEach to loop through the data array
            ForEach(dataArray) { data in
                ZStack {
                    Background(viewState: $viewState, illustration: data.illustration)
                    
                    VStack(spacing:0){
                        
                        Header(isMenu: $isMenu, headerState: $viewState)
                        
                        Spacer()
                        StoryVideo(videoURL: data.signLanguage)
                            .offset(x: 330, y: 0)
                            .padding(.vertical, 80)
              
                        Spacer()
                        Footer(footerState: $viewState, isDisabled: $isDisabled, words: data.words, highlightWord: data.highlightWord)
                    }
                    .padding(38)
                    
                }
                .id(data.id) // Explicitly specify a unique identifier
            }
        }
    }
}

#Preview {
    StoryView(isMenu: .constant(false))
}
