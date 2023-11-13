//
//  ProgressBar.swift
//  BTProjects
//
//  Created by Sarah Uli Octavia on 07/11/23.
//

import SwiftUI

struct ProgressBar: View {
    
    var totalWords: Int
    var step: Int
    @State var containerWidth: CGFloat = 0
    
    var maxWidth: Double {
        return min(containerWidth / CGFloat(totalWords) * CGFloat(step), containerWidth)
    }
    
    
    var body: some View {
        ZStack{
            //MARK: Progress Capsule
            GeometryReader { proxy in
                ZStack(alignment: .leading){
                    Capsule()
                        .fill(Color.Gray6)
                    
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
                    Image("star-journey")
                        .resizable()
                        .frame(width: 38, height: 38)
                        .shadow(color: Color.Orange3.opacity(0.5), radius: 20, x: 0, y: 4)
                        .offset(x: maxWidth - 38)
                    
                }
                
            }
            .frame(height: 38)
            
            
            
        }
        
    }
}

#Preview {
    ProgressBar(totalWords: 10, step: 8)
}
