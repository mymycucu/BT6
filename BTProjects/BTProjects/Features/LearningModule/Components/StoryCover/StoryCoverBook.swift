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
                .frame(width: 610, height: 714)
            /// to define different corner radius
                .clipShape(
                    RoundedCorner(topLeft: 20, topRight: 40, bottomLeft: 20, bottomRight: 40)
                )
                
                
            //MARK: Book's Pages
            RoundedRectangle(cornerRadius: 0)
                .fill(Color.Gray5)
                .frame(width: 600, height: 714)
            /// to define different corner radius
                .clipShape(
                    RoundedCorner(topLeft: 20, topRight: 40, bottomLeft: 20, bottomRight: 40)
                )
                .shadow(color: .black.opacity(0.25), radius: 1.5, x: 2, y: 0)
            
            RoundedRectangle(cornerRadius: 0)
                .fill(Color.Gray6)
                .frame(width: 590, height: 714)
            /// to define different corner radius
                .clipShape(
                    RoundedCorner(topLeft: 20, topRight: 40, bottomLeft: 20, bottomRight: 40)
                )
                .shadow(color: .black.opacity(0.25), radius: 1.5, x: 2, y: 0)
            
            //MARK: Story Front Cover
            ZStack {
                Image(storyThumbnail)
                    .resizable()
                    .scaledToFill()
                
                VStack{
                    Spacer()
                    
                    Image("Play")
                        .frame(width: 171, height: 171)
                        .padding(.bottom, 50)
                    
                    
                    
                    LinearGradient(
                        gradient: Gradient(
                            stops: [
                                .init(color: .PB500, location: 0.15), // Starting around $0% from the bottom
                                .init(color: .clear, location: 0.6) // Strating 0.6 - completely clear
                            ]
                        ),
                        startPoint: .bottom,
                        endPoint: .top
                    )
                    .frame(height:200)
                    
                }
                .frame(width: 583, height: 714)
            }
            .frame(width: 583, height: 714)
            .clipShape(
                RoundedCorner(topLeft: 20, topRight: 40, bottomLeft: 20, bottomRight: 40)
            )
            .shadow(color: .black.opacity(0.25), radius: 1.5, x: 2, y: 0)
            
            
        }
        
    }
}

#Preview {
    StoryCoverBook(storyThumbnail: "story_cover", storyTitle: "hallooo")
}

