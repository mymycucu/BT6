//
//  MultipleChoiceText.swift
//  BTProjects
//
//  Created by Ario Syahputra on 09/11/23.
//

import SwiftUI

struct MultipleChoiceQuestion: View {
    var question: String
    var body: some View {
        VStack {
            
            Text(question)
                .font(.Subhead1_Medium)
                .foregroundColor(.white)
        }
    }
}

#Preview {
    MultipleChoiceQuestion(question: "test")
}
