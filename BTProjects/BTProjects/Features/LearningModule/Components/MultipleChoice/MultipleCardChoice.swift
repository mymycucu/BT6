//
//  Image3DContainer.swift
//  BTProjects
//
//  Created by Ario Syahputra on 10/11/23.
//

import SwiftUI

struct MultipleCardChoice: View {
    @State var imageTitle: String
    @State var containerColor: Color = .white
    @State var containerOpacity: Bool = true
    @State var containerShadowColor: Color = Color.PB300
    @Binding var isSelected: Bool
    @State var isAnimate: Bool = false
    @Binding var isQuestionDone: Bool
    
//    var onTap: () -> Void
    var correctAnswer: Bool


    var body: some View {
        ZStack(alignment: .topLeading){
            //MARK: Container Shadow
            RoundedRectangle(cornerRadius: 19 )
                .fill(containerShadowColor)
                .frame(width: 300, height: 205)
                .padding(.leading, 6.7)
                .padding(.top, 6.7)
            
            //MARK: Container
            RoundedRectangle(cornerRadius: 19 )
                .fill(containerColor)
                .frame(width: 300, height: 205)
                .opacity(containerOpacity ? 1 : 0)
                .padding(.trailing, 6.7)
                .padding(.bottom, 6.7)
            
            //MARK: Image
            Image(imageTitle)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 285, height: 190)
                .clipShape(RoundedRectangle(cornerRadius: 12))
                .padding(.top, isAnimate ? 14.7 : 8)
                .padding(.leading, isAnimate ? 14.7 : 8)
        }
        .onChange(of: isQuestionDone){
            if correctAnswer && isQuestionDone {
                containerColor = .Green2
                containerShadowColor = .Green3 
            }
            
        }
        .onChange(of: isSelected){
            withAnimation(Animation.bouncy(duration: 0.1)) {
                isAnimate.toggle()
                containerOpacity.toggle()
                containerShadowColor = .white
            }
            // Additional delayed animations
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                withAnimation (Animation.bouncy(duration: 0.3))  {
                    isAnimate.toggle()
                    if isSelected {
                        containerOpacity.toggle()
                        containerColor = correctAnswer ? .Green2 : .Red2
                        containerShadowColor = correctAnswer ? .Green3 : .Red3
                        if !correctAnswer{
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3){
                                withAnimation(Animation.bouncy(duration: 0.3)){
                                    isSelected = false
                                }
                            }
                        }
                    } else {
                        containerOpacity.toggle()
                        containerColor = .white
                        containerShadowColor = .PB300
                    }
                }
            }
        }
        .frame(width: 308, height: 212)
        
    }
}

//#Preview {
//    MultipleCardChoice()
//}
