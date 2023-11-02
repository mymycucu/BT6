//
//  StoryBook.swift
//  BTProjects
//
//  Created by Sarah Uli Octavia on 02/11/23.
//

import SwiftUI

struct StoryBook: View {
    @State var storyTitle: String = "mencari-kumbang"
    var body: some View {
        ZStack(alignment: .leading){
            RoundedRectangle(cornerRadius: 0)
                .fill(Color.Orange3)
                .frame(width: 420, height: 254)
            /// to define different corner radius
                .clipShape(
                    RoundedCorner(
                        radius: 12,
                        corners: [.topRight, .bottomRight])
                )
            
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
            
            Image(storyTitle)
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
    StoryBook()
}
