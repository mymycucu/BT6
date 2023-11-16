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
    @State var isQuizFinished: Bool
    
    var body: some View {
        VStack (alignment: .leading) {
            // MARK: Back Button
            Button(action: {
                presentationMode.wrappedValue.dismiss()
            }) {
                Image(systemName: "arrowshape.left.fill")
                    .font(.Button)
                
            }
            .buttonStyle(CircularButtonStyle())
            
            
            Spacer()
            
            VStack (alignment: .leading) {
                Text("\(storyPages) halaman")
                    .foregroundColor(.white)
                    .font(.Subhead1_Regular)
                
                Text(storyTitle)
                    .foregroundColor(.white)
                    .font(.CoverTittle)
                
                
                Button(action: {
                    // Add your action code here
                }) {
                    HStack(alignment: .center, spacing: 0) {
                        Text(isQuizFinished ? "Ulangi Kuis" : "Mulai Kuis")
                            .font(.Caption_Medium)
                            .foregroundColor(Color.white)
                    }
                    .frame(width: 200, height: 62)
                    .background(canStartQuiz ? Color.Orange5 : Color.Orange4)
                    .cornerRadius(12)
                }
                // Set the button's disabled state based on the canStartQuiz variable using a ternary operator
                .disabled(!canStartQuiz)
            }
            .padding(.bottom, 55)
        }
    }
}

#Preview {
    StoryCoverContent(storyPages: 3, storyTitle: "Test", canStartQuiz: true, isQuizFinished: false)
}
