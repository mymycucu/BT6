//
//  CorrectSLView.swift
//  BTProjects
//
//  Created by Ario Syahputra on 08/11/23.
//

import SwiftUI

struct TirukanCorrect: View {
    var body: some View {
        ZStack {
            Rectangle()
              .foregroundColor(.clear)
//              .frame(width: 1194, height: 834)
              .background(Color(red: 0.04, green: 0.16, blue: 0.07).opacity(0.5))
            
            VStack {
                
                LottieView(name: "correct", loopMode: .loop)
                                    .frame(width: 365, height: 240)
                
                Image("correct-state")
                
            }
            
            
        }
    }
}

#Preview {
    TirukanCorrect()
}
