//
//  TripleCardChoice.swift
//  BTProjects
//
//  Created by Ario Syahputra on 10/11/23.
//

import SwiftUI

struct TripleCardChoice: View {
    @State var imageTitle: String = "story_dummy"
    @State var containerColor: Color = .white
    @State var containerOpacity: Bool = true
    @State var containerShadowColor: Color = Color.PB300
    @State var isSelected: Bool = false
    @State var isAnimate: Bool = false

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
            Image("story_dummy")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 285, height: 190)
                .clipShape(RoundedRectangle(cornerRadius: 12))
                .padding(.top, isAnimate ? 14.7 : 8)
                .padding(.leading, isAnimate ? 14.7 : 8)
        }
        .onTapGesture {
            withAnimation(Animation.spring(duration: 0.1)) {
                isSelected.toggle()
                isAnimate.toggle()
                containerOpacity.toggle()
                if isSelected == true {
                    containerShadowColor = .white
                } else {
                    containerShadowColor = .white
                }

                
            }
            // Additional delayed animations
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                withAnimation (Animation.spring(duration: 0.2))  {
                    isAnimate.toggle()
                    if isSelected == true  {
                        containerOpacity.toggle()
                        containerColor = .Green2
                        containerShadowColor = .Green3
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

#Preview {
    TripleCardChoice()
}
