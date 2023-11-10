//
//  QuizHeader.swift
//  BTProjects
//
//  Created by Sarah Uli Octavia on 09/11/23.
//

import SwiftUI

struct QuizHeader: View {
    var body: some View {
        HStack(spacing: 15){
            Button(action: {
                
            }) {
                Image(systemName: "list.bullet")
                    .font(.Button)
            }
            .buttonStyle(CircularButtonStyle())
            ProgressBar()
            Button(action: {
                
            }) {
                Image(systemName: "xmark")
                    .font(.Button)
            }
            .buttonStyle(CircularButtonStyle())
        }
    }
}

#Preview {
    QuizHeader()
}
