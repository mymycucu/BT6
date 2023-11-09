//
//  CorrectState.swift
//  BTProjects
//
//  Created by Ario Syahputra on 09/11/23.
//

import SwiftUI

struct ExitState: View {
    var body: some View {
        
        ZStack {
            Rectangle()
                .foregroundColor(.clear)
                .frame(width: 1194, height: 834)
                .background(Color.black.opacity(0.7))
            
            VStack(alignment: .center, spacing: 32) {
                
                HStack {
                    Spacer()
                    
                    //MARK: X Button
                    Button(action: {
                                // Add your action code here
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
                                        .inset(by: 1.5)
                                        .stroke(Color.PB500, lineWidth: 3)
                                )
                                

                            }

                    
                }
                
                LottieView(name: "correct", loopMode: .loop)
                    .frame(width: 365, height: 240)
                
                
                Text("Nanti kita sambung lagi, ya? ☺️")
                    .font(.Subhead1_Medium)
                    .padding(.vertical, 20)
                
                Button(action: {
                    // Your action or code to be executed when the button is tapped
                }) {
                    HStack(alignment: .center, spacing: 10) {
                        Text("Oke 👍🏻")
                            .font(.Caption_Medium)
                            .foregroundColor(.PB500)
                    }
                    .frame(width: 269, height: 52, alignment: .center)
                    .background(Color.white) // Use Color.white instead of .white
                    .cornerRadius(12)
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .inset(by: 1.5)
                            .stroke(Color.PB500, lineWidth: 3)
                    )
                }
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

#Preview {
    ExitState()
}
