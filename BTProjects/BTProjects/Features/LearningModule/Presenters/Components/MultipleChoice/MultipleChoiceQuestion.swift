//
//  MultipleChoiceText.swift
//  BTProjects
//
//  Created by Ario Syahputra on 09/11/23.
//

import SwiftUI

struct MultipleChoiceQuestion: View {
    var body: some View {
        VStack {
            
            Text("Apa yang harus kamu lakukan?")
                .font(.Subhead1_Medium)
                .foregroundColor(.white)
        }
    }
}

#Preview {
    MultipleChoiceQuestion()
}
