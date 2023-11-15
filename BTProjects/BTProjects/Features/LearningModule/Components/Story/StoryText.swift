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
                .multilineTextAlignment(.leading)
                .padding(.horizontal, 22)
                .padding(.vertical, 18)

        }
        .frame(width: 986, alignment: .leading)
        .background(Color(.systemGray6))
        .cornerRadius(12)
    }

}


//#Preview {
//    StoryText()
//}
