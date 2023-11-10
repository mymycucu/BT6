//
//  MultipleChoiceAnswers.swift
//  BTProjects
//
//  Created by Ario Syahputra on 09/11/23.
//

import SwiftUI

struct MultipleChoiceAnswers: View {
    var body: some View {
        HStack (spacing: 30) {
            // MARK: Left Answer
            Button(action: {
                // Add your action code here
            }) {
                Image("story_dummy")
                    .resizable()
                    .cornerRadius(20)
                    .frame(width: 302, height: 205)
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.PB400, lineWidth: 8) // First stroke with Color.PB400
                    )

            }



            // MARK: Right Answer
            Button(action: {
                        // Add your action code here
                    }) {
                        Image("story_dummy")
                            .resizable()
                            .cornerRadius(20)
                            .frame(width: 302, height: 205)
                            .overlay(
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(Color.PB400, lineWidth: 8) // Use your desired stroke color
                            )
                    }
        }
    }
}

#Preview {
    MultipleChoiceAnswers()
}
