//
//  MultipleChoiceProgressBar.swift
//  BTProjects
//
//  Created by Ario Syahputra on 09/11/23.
//

import SwiftUI

struct MultipleChoiceProgressBar: View {
    
    @State var totalWords: Int = 4
    @State var step: Int =  2
    @State var containerWidth: CGFloat = 0
    
    var maxWidth: Double {
        return min(containerWidth / CGFloat(totalWords) * CGFloat(step), containerWidth)
    }
    
    var orangeRightPoint: CGFloat {
        return CGFloat(maxWidth)
    }
    
    var body: some View {
        ZStack{
            //MARK: Progress Capsule
            GeometryReader { proxy in
                ZStack(alignment: .leading){
                    Capsule()
                        .fill(Color(.systemGray6))
                    
                        .frame(height: 22)
                    Capsule()
                        .fill(Color.Orange4)
                        .frame(minWidth: maxWidth)
                        .frame(height: 22)
                        .opacity(step == 0 ? 0:1)
                        .fixedSize()
                    
                }
                .frame(height: 38)
                .onAppear {
                    containerWidth = proxy.size.width
                }

                //MARK: Stars Progress
                HStack(spacing: 0){
                    ForEach(1...totalWords, id: \.self){ index in
                        ///  min 38 -> width of image
                        let starPosition = (containerWidth / CGFloat(totalWords)) * CGFloat(index) - (38 * CGFloat(index))
                        HStack {
                            ZStack{
                                Image("star-journey-disabled")
                                    .resizable()
                                    .frame(width: 22, height: 22)
                                    .offset(x: (containerWidth / CGFloat(totalWords)) * CGFloat(index) - (37 * CGFloat(index)) )
                                
                                Image("star-journey")
                                    .resizable()
                                    .frame(width: 38, height: 38)
                                    .shadow(color: Color.Orange3.opacity(0.5), radius: 20, x: 0, y: 4)
                                    .opacity(step >= index ? 1 : 0)
                                    .offset(x: starPosition )
                                
                            }
                        }
                        
                        
                        
                    }
                    
                }
                .frame(height: 38)
                
            }
            .frame(height: 38)
            
            
            
        }
        
    }
}

#Preview {
    MultipleChoiceProgressBar()
}
