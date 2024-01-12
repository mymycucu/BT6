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
    var isComingSoon: Bool = false
    var body: some View {
        ZStack(alignment: .leading){
            //MARK: Orange Back Cover
            RoundedRectangle(cornerRadius: 0)
                .fill(Color.Orange4)
            /// to define different corner radius
                .cornerRadius(12)
            //MARK: Book's Pages
            RoundedRectangle(cornerRadius: 0)
                .fill(Color.Gray5)
            //                .frame(width: 415, height: 244)
            /// to define different corner radius
                .clipShape(
                    RoundedCorner(topLeft: 12, topRight: 7, bottomLeft: 12, bottomRight: 7)
                )
                .shadow(color: .black.opacity(0.25), radius: 1.5, x: 2, y: 0)
                .padding(.trailing,5)
                .padding(.vertical,5)
            
            RoundedRectangle(cornerRadius: 0)
                .fill(Color.Gray6)
            /// to define different corner radius
                .clipShape(
                    RoundedCorner(topLeft: 12, topRight: 7, bottomLeft: 12, bottomRight: 7)
                )
                .shadow(color: .black.opacity(0.25), radius: 1.5, x: 2, y: 0)
                .padding(.trailing,10)
                .padding(.vertical,5)
            
            //MARK: Story Front Cover
            if isComingSoon {
                ZStack {
                    Image(storyThumbnail)
                        .resizable()
                        .scaledToFill()
                        .blur(radius: 8)
                        .overlay(
                            RoundedRectangle(cornerRadius: 0)
                                .fill(Color.black)
                                .opacity(0.45)
                        )
                        .frame(minWidth: 339, maxWidth:588 , minHeight: 205, maxHeight: 355)
                    
                    
                    Circle()
                        .fill(Color.Gray6.opacity(0.5))
                        .frame(width: 78, alignment: .center)
                    Image(systemName: "lock.fill")
                        .font(.Button)
                        .foregroundColor(.white)
                    VStack(alignment:.leading) {
                        Spacer()
                        HStack(alignment:.bottom){
                            Text(storyTitle)
                                .font(.Body_Semibold)
                                .foregroundStyle(.white)
                            Spacer()
                        }
                        .padding(15)
                        
                    }
                    
                }
                .cornerRadius(12)
                .shadow(color: .black.opacity(0.25), radius: 1.5, x: 2, y: 0)
                .padding(.trailing,15)
                
            } else {
                ZStack {
                    Image(storyThumbnail)
                        .resizable()
                        .scaledToFill()
                        .frame(minWidth: 339, maxWidth:588 , minHeight: 205, maxHeight: 355)
                    
                    
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
                    
                    VStack(alignment:.leading) {
                        Spacer()
                        HStack(alignment:.bottom){
                            Text(storyTitle)
                                .font(.Body_Semibold)
                                .multilineTextAlignment(.leading)
                                .foregroundStyle(.white)
                            Spacer()
                        }
                        .padding(15)
                        
                    }
                    
                }
                .cornerRadius(12)
                .shadow(color: .black.opacity(0.25), radius: 1.5, x: 2, y: 0)
                .padding(.trailing,15)
                
            }
            
        }
        .aspectRatio(4.2/2.54, contentMode: .fit)
        .frame(minWidth: 339, maxWidth:588 , minHeight: 205, maxHeight: 355)
        
        
    }
}

#Preview {
    StoryBook(storyThumbnail: "mencari-kumbang", storyTitle: "hallooo", isComingSoon: false)
}
