//
//  Image3DContainer.swift
//  BTProjects
//
//  Created by Sarah Uli Octavia on 09/11/23.
//

import SwiftUI

struct Image3DContainer: View {
    @State var imageTitle: String = "mencari-kumbang"
    @State var containerColor: Color = .white
    @State var containerOpacity: Bool = false
    @State var containerShadowColor: Color = Color.PB300
    @Binding var isSelected: Bool
    @State var isAnimate: Bool = false

    var body: some View {
        ZStack(alignment: .topLeading){
            //MARK: Container Shadow
            RoundedRectangle(cornerRadius: 19 )
                .fill(isSelected ? Color.white : Color.PB300  )
                .frame(width: 300, height: 205)
                .padding(.leading, 6.7)
                .padding(.top, 6.7)
            
            //MARK: Container
            RoundedRectangle(cornerRadius: 19 )
                .fill(containerColor)
                .frame(width: 300, height: 205)
                .opacity(isSelected ? 0 : 1)
                .padding(.trailing, 6.7)
                .padding(.bottom, 6.7)
            
            //MARK: Image
            Image("mencari-kumbang")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 285, height: 190)
                .clipShape(RoundedRectangle(cornerRadius: 12))
                .padding(.top, isSelected ? 14.7 : 8)
                .padding(.leading, isSelected ? 14.7 : 8)
        }
//        .onTapGesture {
//            withAnimation(Animation.bouncy(duration: 0.1)) {
//                isAnimate.toggle()
//                containerOpacity.toggle()
//                if isSelected == false {
//                    containerShadowColor = .white
//                    
//                } else {
//                    containerShadowColor = .PB300
//                }
//                
//
//                
//            }
//            // Additional delayed animations
////            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
////                withAnimation (Animation.linear)  {
////                    isAnimate.toggle()
////                    if isSelected == true  {
////                        containerOpacity.toggle()
////                        containerColor = .Green2
////                        containerShadowColor = .Green3
////                    } else {
////                        containerOpacity.toggle()
////                        containerColor = .white
////                        containerShadowColor = .PB300
////                    }
////                    
////                }
////            }
//        }
        .frame(width: 308, height: 212)
    }
}

#Preview {
    Image3DContainer(isSelected: .constant(false))
}
