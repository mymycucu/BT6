//
//  MultipleChoiceView.swift
//  BTProjects
//
//  Created by Ario Syahputra on 09/11/23.
//

import SwiftUI

struct MultipleChoiceView: View {
    var body: some View {
        ZStack {
            
            MultipleChoiceBackground()
            
            VStack {
                

                MultipleChoiceTopBar()
                    .padding(.horizontal, 30)
                    .padding(.top, 40)

                HStack {
                    MultipleChoiceVideo()
                        .padding()
                    
                    MultipleChoiceImage()
                }
                
                MultipleChoiceText()
                
                MultipleChoiceAnswers()
                
                
                MultipleChoiceBottomBar()
                    .padding(.horizontal, 30)
                
            }
        }
    }
}

#Preview {
    MultipleChoiceView()
}
