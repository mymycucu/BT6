//
//  StoryText.swift
//  BTProjects
//
//  Created by Ario Syahputra on 25/10/23.
//

import SwiftUI

struct StoryText: View {
    
    var words: String
    var highlightWord: String
    
    var body: some View {
        
        HStack(alignment: .center) {
            Text(words)
                .font(.Subhead1_Medium)
        
            //MARK: Story Words
//            ForEach(words.components(separatedBy: " "), id: \.self) { word in
//                Text(word)
//                    .font(.Subhead1_Medium)
//                    .foregroundColor(word == highlightWord ? Color.Purple5 : .PB500)
//            }

        }
        .padding(.horizontal, 10)
        .padding(.vertical, 18)
        .frame(width: 986, alignment: .center)
        .background(Color(.systemGray6))
        .cornerRadius(12)
    }

}


//#Preview {
//    StoryText()
//}
