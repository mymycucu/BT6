//
//  CorrectState.swift
//  BTProjects
//
//  Created by Ario Syahputra on 09/11/23.
//

import SwiftUI

struct ExitState: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @Binding var isExitState: Bool
    
    var body: some View {
        
        ZStack {
          
            Rectangle()
                .foregroundColor(.clear)
                .background(Color.black.opacity(0.7))
            
            VStack {
                HStack {
                    Spacer()
                    
                    //MARK: X Button
                    Button(action: {
                        isExitState.toggle()
                    }) {
                        
                        HStack(alignment: .center, spacing: 0) {
                            Image(systemName: "xmark")
                                .bold()
                                .imageScale(.large)
                                .foregroundColor(Color.PB500)
                            
                        }
                        .frame(width: 44, height: 44)
                        .background(Color.white)
                        .cornerRadius(100)
                        .overlay(
                            RoundedRectangle(cornerRadius: 100)
                                .inset(by: 1)
                                .stroke(Color.PB500, lineWidth: 3)
                        )
                    }
                }
                .frame(width: 594, alignment: .bottom)
                
                VStack(alignment: .center, spacing: 32) {
                    LottieView(name: "correct", loopMode: .loop)
                        .frame(width: 365, height: 240)
                    
                    
                    Text("Nanti kita sambung lagi, ya? ☺️")
                        .font(.Subhead1_Medium)
                        .padding(.vertical, 20)
                    
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        Text("Oke 👍🏻")
                            .frame(width: 180)
                    }
                    .buttonStyle(RoundedButtonStyle())
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
            )
            }
            
        }
        
        
    }
}

#Preview {
    ExitState(isExitState: .constant(false))
}
