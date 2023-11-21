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
    @Binding var isCorrect: Bool
    @Binding var isFalse: Bool
    
    
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
                    .stroke(isCorrect ? Color.Green3 : isFalse ? Color.Red3 : isSelected ? Color.PB100  : Color.PB400,  style: isCorrect ? StrokeStyle(lineWidth: 5) : isFalse ? StrokeStyle(lineWidth: 5) : isSelected ? StrokeStyle(lineWidth: 5) : StrokeStyle(lineWidth: 2.8, lineCap: .round, dash: [6, 6]))
            )
            
            
            //MARK: Circle
            HStack(spacing: 0){
                if position == .left {
                    Spacer()
                }
                ZStack{
                    Circle()
                        .fill(isCorrect ? Color.Green3 : isFalse ? Color.Red3 : isSelected ? Color.PB100 :  Color.PB400)
                        .frame(width: 25)
                    
                    Circle()
                        .fill(isCorrect ? Color.PB400 : isFalse ? Color.PB400 : isSelected ? Color.PB400 : Color.PB100)
                        .frame(width: 15)
                }
                if position == .right {
                    Spacer()
                }
                
            }
            
            
        }
        .frame(width:276, height: 196)
        
    }
}

#Preview {
    ImageContainer( isSelected: .constant(false), isCorrect: .constant(false), isFalse: .constant(false))
}
