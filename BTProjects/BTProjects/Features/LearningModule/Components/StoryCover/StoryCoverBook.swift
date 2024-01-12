//
//  StoryCoverBook.swift
//  BTProjects
//
//  Created by Ario Syahputra on 12/11/23.
//

import SwiftUI

struct StoryCoverBook: View {
    var storyThumbnail: String
    var storyTitle: String
    
    var body: some View {
        ZStack(alignment: .leading){
            //MARK: Orange Back Cover
            RoundedRectangle(cornerRadius: 0)
                .fill(Color.Orange4)
            /// to define different corner radius
                .clipShape(
                    RoundedCorner(topLeft: 20, topRight: 40, bottomLeft: 20, bottomRight: 40)
                )
                
                
            //MARK: Book's Pages
            RoundedRectangle(cornerRadius: 0)
                .fill(Color.Gray5)
            /// to define different corner radius
                .clipShape(
                    RoundedCorner(topLeft: 20, topRight: 40, bottomLeft: 20, bottomRight: 40)
                )
                .shadow(color: .black.opacity(0.25), radius: 1.5, x: 2, y: 0)
                .padding(.trailing,10)
            
            RoundedRectangle(cornerRadius: 0)
                .fill(Color.Gray6)
            /// to define different corner radius
                .clipShape(
                    RoundedCorner(topLeft: 20, topRight: 40, bottomLeft: 20, bottomRight: 40)
                )
                .shadow(color: .black.opacity(0.25), radius: 1.5, x: 2, y: 0)
                .padding(.trailing,20)
            
            //MARK: Story Front Cover
            ZStack {
                Image(storyThumbnail)
                    .resizable()
                    .scaledToFill()
                
                VStack{
                    Spacer()
                    
                    Image("Play")
                        .aspectRatio(1/1, contentMode: .fit)
                        .frame(minWidth: 153, maxWidth:205 , minHeight: 153, maxHeight: 205)
                        .padding(.bottom, 50)
                    
                    
                    
                    Spacer()
                    
                }
                LinearGradient(
                    gradient: Gradient(colors: [.PB500.opacity(0.5), .PB500.opacity(0.3)]),
                    startPoint: .bottom,
                    endPoint: .top
                )

            }
            .clipShape(
                RoundedCorner(topLeft: 20, topRight: 40, bottomLeft: 20, bottomRight: 40)
            )
            .shadow(color: .black.opacity(0.25), radius: 1.5, x: 2, y: 0)
            .padding(.trailing,30)
            
            
        }
        .aspectRatio(6.03/7.24, contentMode: .fit)
        .frame(minWidth: 542, maxWidth:723 , minHeight: 652, maxHeight: 868)
        
    }
}

#Preview {
    StoryCoverBook(storyThumbnail: "story_cover", storyTitle: "hallooo")
}

