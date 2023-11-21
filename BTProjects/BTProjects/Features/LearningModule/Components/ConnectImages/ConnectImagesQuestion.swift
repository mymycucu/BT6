//
//  ConnectImagesQuestion.swift
//  BTProjects
//
//  Created by Sarah Uli Octavia on 19/11/23.
//

import SwiftUI

struct ConnectImagesQuestion: View {
    @Binding var isQuestion:Bool
    
    var body: some View {
        
        ZStack {
          
            Rectangle()
                .foregroundColor(.clear)
                .background(Color.black.opacity(0.7))
            
            
            VStack(alignment: .center, spacing: 32) {
               
                LottieView(name: "correct", loopMode: .loop)
                    .frame(width: 365, height: 240)
                
                
                Text("Hubungkan Gambar yang sesuai")
                    .font(.Subhead1_Medium)
                    .padding(.vertical, 20)
                
                Button(action: {
                    isQuestion.toggle()
                }) {
                    Text("Oke 👍🏻")
                        .frame(width: 180)
                }
                .buttonStyle(RoundedSecondaryBlueButtonStyle())
                .padding(.vertical, 20)
            }
            .padding(.horizontal, 32)
            .padding(.vertical, 30)
            .frame(width: 594, alignment: .bottom)
            .background(Color.Gray6)
            .cornerRadius(24)
            .overlay(
                RoundedRectangle(cornerRadius: 24)
                    .inset(by: 3)
                    .stroke(Color.PB400, lineWidth: 6)
                    .transition(.moveAndFadeTopRight)
        )
            
        }
        
        
    }
}

#Preview {
    ConnectImagesQuestion(isQuestion: .constant(true))
}
