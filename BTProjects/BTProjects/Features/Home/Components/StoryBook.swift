//
//  StoryBook.swift
//  BTProjects
//
//  Created by Sarah Uli Octavia on 02/11/23.
//

import SwiftUI

struct StoryBook: View {
    var storyThumbnail: String
    var storyTitle: String
    var body: some View {
        ZStack(alignment: .leading){
            //MARK: Orange Back Cover
            RoundedRectangle(cornerRadius: 0)
                .fill(Color.Orange4)
                .frame(width: 420, height: 254)
            /// to define different corner radius
                .clipShape(
                    RoundedCorner(
                        radius: 12,
                        corners: [.topRight, .bottomRight])
                )
            //MARK: Book's Pages
            RoundedRectangle(cornerRadius: 0)
                .fill(Color.Gray5)
                .frame(width: 415, height: 244)
            /// to define different corner radius
                .clipShape(
                    RoundedCorner(
                        radius: 7,
                        corners: [.topRight, .bottomRight])
                )
                .shadow(color: .black.opacity(0.25), radius: 1.5, x: 2, y: 0)
            
            RoundedRectangle(cornerRadius: 0)
                .fill(Color.Gray6)
                .frame(width: 410, height: 244)
            /// to define different corner radius
                .clipShape(
                    RoundedCorner(
                        radius: 7,
                        corners: [.topRight, .bottomRight])
                )
                .shadow(color: .black.opacity(0.25), radius: 1.5, x: 2, y: 0)
            
            //MARK: Story Front Cover
            ZStack {
                Image(storyThumbnail)
                
                
                VStack{
                    Spacer()
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
                .frame(width: 405, height: 254)
                
                VStack(alignment:.leading) {
                    Spacer()
                    HStack(alignment:.bottom){
                        Text(storyTitle)
                            .font(.Body_Semibold)
                            .foregroundStyle(.white)
                        Spacer()
                    }
                    .padding(15)
                    
                }.frame(width: 405, height: 254)
                
            }
            .frame(width: 405, height: 254)
            .clipShape(
                RoundedCorner(
                    radius: 12,
                    corners: [.topRight, .bottomRight])
            )
            .shadow(color: .black.opacity(0.25), radius: 1.5, x: 2, y: 0)
            
            
        }
        .frame(width: 420, height: 254)
        
    }
}

#Preview {
    StoryBook(storyThumbnail: "sl_b_default", storyTitle: "hallooo")
}
