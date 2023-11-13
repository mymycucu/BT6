//
//  QuizDoneContent.swift
//  BTProjects
//
//  Created by Ario Syahputra on 13/11/23.
//

import SwiftUI

struct QuizDoneContent: View {
    var body: some View {
        VStack {
            LottieView(name: "correct", loopMode: .loop)
                                .frame(width: 365, height: 240)
            
            Text("Woohoo!")
                .font(.Subhead1_Medium)
                .foregroundColor(.white)
                .padding(.top, 40)
            
            Text("Kamu telah menyelesaikan kuismu!")
                .font(.Heading2_Medium)
                .foregroundColor(.white)
            
            
        }
    }
}

#Preview {
    QuizDoneContent()
}
