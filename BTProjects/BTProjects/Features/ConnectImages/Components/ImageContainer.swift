//
//  ImageContainer.swift
//  BTProjects
//
//  Created by Sarah Uli Octavia on 08/11/23.
//

import SwiftUI

enum positionImageContainer {
    case right
    case left
}

struct ImageContainer: View {
    @State var imageTitle: String = "mencari-kumbang"
    @Binding var isSelected: Bool
    @State var position: positionImageContainer = .right
    
    var body: some View {
        /// selection position
        ZStack(alignment: position == .left ? .leading : .trailing){
            //MARK: Image with Outline
            HStack {
                Image(imageTitle)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 250, height: 180)
                    .clipShape(RoundedRectangle(cornerRadius: 14))
            }
            .padding(8)
            .cornerRadius(22)
            .overlay(
                RoundedRectangle(cornerRadius: 22)
                    .inset(by: 2.5)
                    .stroke(isSelected ? Color.PB100 : Color.Gray6,  style: isSelected ? StrokeStyle(lineWidth: 5) : StrokeStyle(lineWidth: 2.8, dash: [6, 6]))
            )
            
            //MARK: Circle
            HStack(spacing: 0){
                if position == .left {
                    Spacer()
                }
                ZStack{
                    Circle()
                        .fill(isSelected ? Color.PB100 : Color.PB300)
                        .frame(width: 25)
                        
                    Circle()
                        .fill(isSelected ? Color.black : Color.white)
                        .frame(width: 15)
                }
                if position == .right {
                    Spacer()
                }
                 
            }
    
            
        }
        .frame(width:276, height: 196)
        .onTapGesture {
            if isSelected == false {
                isSelected = true
            }else{
                isSelected = false
            }
        }
    }
}

#Preview {
    ImageContainer( isSelected: .constant(false))
}
