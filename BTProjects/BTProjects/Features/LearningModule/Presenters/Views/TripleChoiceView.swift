//
//  TripleChoiceView.swift
//  BTProjects
//
//  Created by Ario Syahputra on 10/11/23.
//

import SwiftUI

struct TripleChoiceView: View {
    var body: some View {
        ZStack {
            
            TripleChoiceBackground()
            
            VStack {
                

                TripleChoiceTopBar()
                    .padding(.horizontal, 30)
                    .padding(.top, 40)

                HStack {
                    TripleChoiceVideo()
                        .padding()
                        .padding(.leading, 30)
                    
                    VStack {
                        TripleChoiceText()
                            .padding(.bottom, 150)
                    }
                    
                        
                    
                }
                
                
                TripleChoiceAnswers()
                
                
                TripleChoiceBottomBar()
                    .padding(.horizontal, 30)
                
            }
        }
    }
}

#Preview {
    TripleChoiceView()
}
