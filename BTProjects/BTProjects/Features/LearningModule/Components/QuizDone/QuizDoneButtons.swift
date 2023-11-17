//
//  QuizDoneButtons.swift
//  BTProjects
//
//  Created by Ario Syahputra on 13/11/23.
//

import SwiftUI

struct QuizDoneButtons: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @Binding var bookScene: Int
    var maxBookScene: Int
    
    var body: some View {
        
        
        HStack {
            Button(action: {
                bookScene -= 8
            }) {
                HStack(alignment: .center, spacing: 0) {
                    Text("Ulangi Kuis")
                        .font(.Body_Medium)
                        .foregroundColor(Color.orange)
                }
                .frame(width: 230)
                
            }
            .buttonStyle(RoundedSecondaryButtonStyle())
            .padding()
            
            Button(action: {
                if(bookScene >= maxBookScene-1){
                    presentationMode.wrappedValue.dismiss()
                }
            }) {
                HStack(alignment: .center, spacing: 0) {
                    Text("Selesai")
                        .font(.Body_Medium)
                        .frame(width: 230)
                }
                
            }
            .buttonStyle(RoundedButtonStyle())
            .padding()
        }


    }
}

//#Preview {
//    QuizDoneButtons()
//}
