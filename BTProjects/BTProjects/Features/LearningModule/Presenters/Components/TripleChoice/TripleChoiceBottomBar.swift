//
//  TripleChoiceBottomBar.swift
//  BTProjects
//
//  Created by Ario Syahputra on 10/11/23.
//

import SwiftUI

struct TripleChoiceBottomBar: View {
    var body: some View {
        HStack {
            // MARK: Back Button
            Button(action: {
                        // Add your action code here
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
            
//            MultipleChoiceAnswers()
//                .padding(.bottom, 50)
            
            Spacer()
            

                        
            // MARK: Next Button
            Button(action: {
                        // Add your action code here
                    }) {
                        HStack(alignment: .center, spacing: 0) {
                            Image(systemName: "arrowshape.right.fill")
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
        }
    }
}

#Preview {
    TripleChoiceBottomBar()
}
