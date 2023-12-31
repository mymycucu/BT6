//
//  TripleCardChoice.swift
//  BTProjects
//
//  Created by Ario Syahputra on 10/11/23.
//

import SwiftUI

struct TripleCardChoice: View {
    @State var imageTitle: String
    @State var containerColor: Color = .white
    @State var containerOpacity: Bool = true
    @State var containerShadowColor: Color = Color.PB300
    
    @Binding var isSelected: Bool
    @Binding var correctAnswer: Bool
    
    @State var isAnimate: Bool = false
    @State var isCorrect: Bool = false
    
    @State var count: Int = 0
    
    @Binding var isQuestionDone: Bool
    
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
        .onAppear{
            DispatchQueue.main.async {
                if correctAnswer && isQuestionDone {
                    containerColor = .Green2
                    containerShadowColor = .Green3
                }
            }
        }
        .onChange(of: isSelected) {
            if count < 1 {
                count+=1
                withAnimation(Animation.bouncy(duration: 0.1)) {
                    isAnimate.toggle()
                    containerOpacity.toggle()
                    containerShadowColor = .white
                }
                // Additional delayed animations
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                    withAnimation (Animation.bouncy(duration: 0.2))  {
                        isAnimate.toggle()
                        if isSelected {
                            containerOpacity.toggle()
                            containerColor = correctAnswer ? .Green2 : .Red2
                            containerShadowColor = correctAnswer ? .Green3 : .Red3
                            if !correctAnswer{
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5){
                                    withAnimation(Animation.bouncy(duration: 0.5)){
                                        isSelected = false
                                        
                                    }
                                }
                            }else{
                                isCorrect = correctAnswer
                            }
                            
                        } else {
                            containerOpacity.toggle()
                            containerColor = .white
                            containerShadowColor = .PB300
                        }
                    }
                }
            } else if !correctAnswer {
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
                            }else{
                                isCorrect = correctAnswer
                            }
                        } else {
                            containerOpacity.toggle()
                            containerColor = .white
                            containerShadowColor = .PB300
                        }
                        
                    }
                }
            }
        }
        .frame(width: 308, height: 212)
        
    }
   
}

//#Preview {
//    TripleCardChoice()
//}
