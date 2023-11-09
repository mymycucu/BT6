//
//  WordSummary.swift
//  BTProjects
//
//  Created by Sarah Uli Octavia on 07/11/23.
//

import SwiftUI

struct WordSummary: View {
    @State var word: String = "bahaya"
    @State var disableNext: Bool = false
    var body: some View {
        ZStack(alignment: .center){
            //MARK: Header
            
            VStack(spacing: 0){
                SummaryHeader()
                    
                    
                Text(word)
                    .foregroundStyle(.white)
                    .font(.Heading1_Semibold)
                    .underline()
                    .padding(.bottom, 50)
                SummaryVideo()
                    
                Spacer()
                
            }
            
            
            VStack(spacing: 0){
                Spacer()
                
                HStack{
                    Button(action: {
                        // Your action here
                    }) {
                        Image(systemName: "arrowshape.left.fill")
                            .font(.Button)
                    }
                    .buttonStyle(CircularButtonStyle())
                    
                    Spacer()
                    Button(action: {
                        // Your action here
                    }) {
                        HStack(alignment: .center){
                            Text("Lanjut Latihan")
                                .font(.Caption_Medium)
                            Image(systemName: "arrowshape.right.fill")
                                .font(.Button)
                        }
                    }
                    .buttonStyle(RoundedButtonStyle(disabled: disableNext))
                }
                .padding(.top, 55)
                
            }

            
        }
        .padding(.horizontal, 40)
        .padding(.bottom, 40)
        .padding(.top, 20)
        .background(
            ZStack{
                Image("background-word-summary")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                
            }
        
            
        )
        
    }
}

#Preview {
    WordSummary()
}
