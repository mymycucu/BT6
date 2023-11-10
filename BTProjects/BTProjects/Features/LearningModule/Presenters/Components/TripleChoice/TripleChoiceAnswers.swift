//
//  TripleChoiceAnswers.swift
//  BTProjects
//
//  Created by Ario Syahputra on 10/11/23.
//

import SwiftUI

struct TripleChoiceAnswers: View {
    var body: some View {
        
        HStack (spacing: 35) {
            // MARK: First Answer
            Button(action: {
                // Add your action code here
            }) {
                MultipleCardChoice()

            }

            // MARK: Second Answer
            Button(action: {
                // Add your action code here
            }) {
                MultipleCardChoice()
                
            }
            
            // MARK: Third Answer
            Button(action: {
                // Add your action code here
            }) {
                MultipleCardChoice()
                
            }
        }
    }
}

#Preview {
    TripleChoiceAnswers()
}
