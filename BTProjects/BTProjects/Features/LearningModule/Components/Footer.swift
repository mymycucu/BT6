//
//  Footer.swift
//  BTProjects
//
//  Created by Sarah Uli Octavia on 13/11/23.
//

import SwiftUI

struct Footer: View {
    @Binding var headerState: HeaderState
    var words: String
    var highlightWord: String
    
    var body: some View {
        
        HStack (spacing: 15 ){
            // MARK: Back Button
            
            Button(action: {
                
            }) {
                Image(systemName: "arrowshape.left.fill")
                    .font(.Button)
            }
            .buttonStyle(CircularButtonStyle())
            
            if headerState == .story{
                StoryText(words: words, highlightWord: highlightWord)
            } else {
                Spacer()
            }
            
            
            // MARK: Next Button
            
            Button(action: {
                
            }) {
                Image(systemName: "arrowshape.right.fill")
                    .font(.Button)
            }
            .buttonStyle(CircularButtonStyle())
            
        }
        .frame(height: 105)
        
        
    }
}

//#Preview {
//    Footer()
//}
