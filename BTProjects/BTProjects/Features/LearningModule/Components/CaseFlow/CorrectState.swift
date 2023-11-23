//
//  CorrectState.swift
//  BTProjects
//
//  Created by Ario Syahputra on 09/11/23.
//

import SwiftUI
import Giffy

struct CorrectState: View {
    @Binding var isCorrectState: Bool
    @Binding var isDisabled:Bool
        
    var body: some View {
        ZStack {
            Rectangle()
              .foregroundColor(.clear)
              .background(Color.Overlay3.opacity(0.8))
            
            ZStack {
//                LottieView(name: "correct", loopMode: .loop)
//                                    .frame(width: 365, height: 240)
//                LottieView(name: "kamu-benar", loopMode: .loop)
//                    .frame(width: 900, height: 700)
                
//                dotLottieView(url: Bundle.main.url(forResource: "horevideo", withExtension: "lottie")!)
                Giffy("sl_kamuBenar")
                    .frame(width: 700, height: 700)
            }
        }
        .onTapGesture {
            isCorrectState.toggle()
        }
        .onAppear{
            isDisabled = false
        }
    }

}

#Preview {
    CorrectState(isCorrectState: .constant(false), isDisabled: .constant(false))
}
