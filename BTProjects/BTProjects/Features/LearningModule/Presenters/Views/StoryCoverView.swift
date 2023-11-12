//
//  StoryCoverView.swift
//  BTProjects
//
//  Created by Ario Syahputra on 12/11/23.
//

import SwiftUI

struct StoryCoverView: View {
    
    
    struct StoryCover: Identifiable {
       let id = UUID()
       let storyThumbnail: String
       let storyPages: Int
       let storyTitle: String
        let isFinishedThumbnail: String
   }

    // Sample data array with 5 items
           let dataArray: [StoryCover] = [
            StoryCover(storyThumbnail: "story_cover", storyPages: 3, storyTitle: "Baca Buku Bersama Ayah", isFinishedThumbnail: "StoryCoverFinish")
           ]
    
    var body: some View {
        ZStack {
            
            StoryCoverBackground()
            
            HStack {
                ForEach(dataArray) { storyCover in
                    StoryCoverContent(storyPages: storyCover.storyPages, storyTitle: storyCover.storyTitle)
                        .padding(.leading, 40)

                    Spacer()
                    
                    // MARK: Story Button
                    Button(action: {
                        // Add your action code here
                    }) {
                        StoryCoverBook(storyThumbnail: storyCover.storyThumbnail, storyTitle: storyCover.storyTitle, isFinished: true, isFinishedThumbnail: storyCover.isFinishedThumbnail)
                    }
                    .padding(.horizontal, 40)
                }
            }
        }
    }
}

#Preview {
    StoryCoverView()
}
