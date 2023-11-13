//
//  StoryCoverContent.swift
//  BTProjects
//
//  Created by Ario Syahputra on 12/11/23.
//

import SwiftUI

struct StoryCoverContent: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var storyPages: Int
    var storyTitle: String
    @State var canStartQuiz: Bool
    
    var body: some View {
        VStack (alignment: .leading) {
            // MARK: Back Button
            Button(action: {
                presentationMode.wrappedValue.dismiss()
                    }) {
                        
                        HStack(alignment: .center, spacing: 0) {
                            Image(systemName: "arrowshape.left.fill")
                                .imageScale(.large)
                                .foregroundColor(Color.PB500)

                        }
                        .frame(width: 62, height: 62)
                        .background(Color.white)
                        .cornerRadius(100)
                        .overlay(
                            RoundedRectangle(cornerRadius: 100)
                                .inset(by: 1.5)
                                .stroke(Color.PB500, lineWidth: 3)
                        )
                        
                    }
                    .padding(.top, 25)
            
            Spacer()
            
            VStack (alignment: .leading) {
                Text("\(storyPages) halaman")
                    .foregroundColor(.white)
                    .font(.Subhead1_Regular)
                
                Text(storyTitle)
                    .foregroundColor(.white)
                    .font(.Heading1_Semibold)
                
                
                Button(action: {
                    // Add your action code here
                }) {
                    HStack(alignment: .center, spacing: 0) {
                        Text("Mulai Kuis")
                            .font(.Caption_Medium)
                            .foregroundColor(canStartQuiz ? Color.PB500 : Color.PB200)
                    }
                    .frame(width: 174, height: 52)
                    .background(Color.white)
                    .cornerRadius(12)
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .inset(by: 1.5)
                            .stroke(canStartQuiz ? Color.PB500 : Color.PB200, lineWidth: 3)
                    )
                }
                // Set the button's disabled state based on the canStartQuiz variable using a ternary operator
                .disabled(!canStartQuiz)
            }
            .padding(.bottom, 55)
        }
    }
}

#Preview {
    StoryCoverContent(storyPages: 3, storyTitle: "Test", canStartQuiz: false)
}
