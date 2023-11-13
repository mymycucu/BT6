//
//  QuizDoneButtons.swift
//  BTProjects
//
//  Created by Ario Syahputra on 13/11/23.
//

import SwiftUI

struct QuizDoneButtons: View {
    var body: some View {
        
        
        HStack {
            Button(action: {
                // Add your action code here
            }) {
                HStack(alignment: .center, spacing: 0) {
                    Text("Ulangi Kuis")
                        .font(.Body_Medium)
                        .foregroundColor(Color.orange)
                }
                .frame(width: 252, height: 62)
                .background(Color.white)
                .cornerRadius(12)
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(Color.Orange4, lineWidth: 3)
                )
            }
            .padding()
            
            Button(action: {
                // Add your action code here
            }) {
                HStack(alignment: .center, spacing: 0) {
                    Text("Selesai")
                        .font(.Body_Medium)
                        .foregroundColor(.white)
                }
                .frame(width: 252, height: 62)
                .background(Color.Orange4)
                .cornerRadius(12)
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(Color.Orange4, lineWidth: 3)
                )
            }
            .padding()
        }


    }
}

#Preview {
    QuizDoneButtons()
}
