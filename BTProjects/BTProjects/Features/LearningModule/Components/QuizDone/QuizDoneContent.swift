//
//  QuizDoneContent.swift
//  BTProjects
//
//  Created by Ario Syahputra on 13/11/23.
//

import SwiftUI
import Giffy

struct QuizDoneContent: View {
    var body: some View {
        VStack {
//            LottieView(name: "correct", loopMode: .loop)
//                                .frame(width: 365, height: 240)
            
            ZStack {
                Giffy("sl_kamuHebat")
                    .frame(width: 500, height: 500)
            }
            .offset(y: 50)
            
            VStack {
                Text("Woohoo!")
                    .font(.Subhead1_Medium)
                    .foregroundColor(.white)
                    .padding(.top, 40)
                
                Text("Kamu telah menyelesaikan kuismu!")
                    .font(.Heading2_Medium)
                    .foregroundColor(.white)
            }
            .offset(y: -85)
            
        }
//        .background(.black)
    }
}

#Preview {
    QuizDoneContent()
}
