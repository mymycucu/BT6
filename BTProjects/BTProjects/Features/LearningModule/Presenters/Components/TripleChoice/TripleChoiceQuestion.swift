//
//  TripleChoiceText.swift
//  BTProjects
//
//  Created by Ario Syahputra on 10/11/23.
//

import SwiftUI

struct TripleChoiceQuestion: View {
    
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
    TripleChoiceQuestion(question: "Test")
}
