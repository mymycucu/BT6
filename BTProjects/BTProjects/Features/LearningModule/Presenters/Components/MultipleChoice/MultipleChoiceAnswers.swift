//
//  MultipleChoiceAnswers.swift
//  BTProjects
//
//  Created by Ario Syahputra on 09/11/23.
//

import SwiftUI

struct MultipleChoiceAnswers: View {
    var body: some View {
        HStack (spacing: 35) {
            // MARK: Left Answer
            Button(action: {
                // Add your action code here
            }) {
                MultipleCardChoice()

            }



            // MARK: Right Answer
            Button(action: {
                // Add your action code here
            }) {
                MultipleCardChoice()
                
            }
        }
    }
}

#Preview {
    MultipleChoiceAnswers()
}
