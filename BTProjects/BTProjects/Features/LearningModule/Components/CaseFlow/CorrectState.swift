//
//  CorrectState.swift
//  BTProjects
//
//  Created by Ario Syahputra on 09/11/23.
//

import SwiftUI

struct CorrectState: View {
    var body: some View {
        ZStack {
            Rectangle()
              .foregroundColor(.clear)
              .background(Color.Overlay3.opacity(0.8))
            
            VStack {
                
                LottieView(name: "correct", loopMode: .loop)
                                    .frame(width: 365, height: 240)
                
                Image("correct-state")
                
            }
            
            
        }
    }

}

#Preview {
    CorrectState()
}
