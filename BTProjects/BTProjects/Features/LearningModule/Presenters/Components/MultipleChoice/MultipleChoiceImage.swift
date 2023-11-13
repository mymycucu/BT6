//
//  MultipleChoiceImage.swift
//  BTProjects
//
//  Created by Ario Syahputra on 09/11/23.
//

import SwiftUI

struct MultipleChoiceImage: View {
    var body: some View {
        ZStack {
            Image("story_dummy")
            .frame(width: 467, height: 310)
            .cornerRadius(16)
            .padding(8)
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                .inset(by: 1.35)
                .stroke(Color.white, style: StrokeStyle(lineWidth: 2.71, dash: [10.3, 10.3]))
            )
        }
            
    }
}

#Preview {
    MultipleChoiceImage()
}