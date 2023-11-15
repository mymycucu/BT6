//
//  MultipleChoiceImage.swift
//  BTProjects
//
//  Created by Ario Syahputra on 09/11/23.
//

import SwiftUI

struct MultipleChoiceImage: View {
    
    var illustration: String
    
    var body: some View {
        ZStack {
            Image(illustration)
                .frame(width: 455, height: 298)
                .cornerRadius(16)
                .padding(8)
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .inset(by: 1.35)
                        .stroke(Color.white, style: StrokeStyle(lineWidth: 2.71, lineCap: .round, dash: [10.3, 10.3]))
                )
        }
        
    }
}

#Preview {
    MultipleChoiceImage(illustration: "story_dummy")
}
