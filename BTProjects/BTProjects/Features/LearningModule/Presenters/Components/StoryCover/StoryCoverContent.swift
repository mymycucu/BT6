//
//  StoryCoverContent.swift
//  BTProjects
//
//  Created by Ario Syahputra on 12/11/23.
//

import SwiftUI

struct StoryCoverContent: View {
    
    var storyPages: Int
    var storyTitle: String
    var body: some View {
        VStack (alignment: .leading) {
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
                                Text("Latihan Kuis")
                                    .font(.Caption_Medium)
                                .foregroundColor(Color.PB500)

                            }
                            .frame(width: 174, height: 52)
                            .background(Color.white)
                            .cornerRadius(12)
                            
                            
                        }
            }
            .padding(.bottom, 55)
        }
    }
}

//#Preview {
//    StoryCoverContent()
//}
