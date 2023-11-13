//
//  StoryView.swift
//  BTProjects
//
//  Created by Ario Syahputra on 25/10/23.
//

import SwiftUI

struct StoryView: View {
    @Binding var isMenu: Bool
    
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
        StoryData(illustration: "illust_dummy", signLanguage: "dummy", words: "Dino membaca buku", highlightWord: "membaca"),
    ]
    
    var body: some View {
        VStack {
            // Use ForEach to loop through the data array
            ForEach(dataArray) { data in
                ZStack {
                    StoryBackground(illustration: data.illustration)
                        .padding(.top, 20)
                    
                    VStack {
                        StoryTopBar(isMenu: $isMenu)
                            .padding(.horizontal, 30)
                        
                        StoryVideo(videoURL: data.signLanguage)
                            .offset(x: 330, y: 0)
                            .padding(.vertical, 80)
                        
                        StoryBottomBar(words: data.words, highlightWord: data.highlightWord)
                            .padding(5)
                    }
                    .padding(.top, 30)
                }
                .id(data.id) // Explicitly specify a unique identifier
            }
        }
    }
}

#Preview {
    StoryView(isMenu: .constant(false))
}
