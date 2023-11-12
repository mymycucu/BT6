//
//  RibbonPage.swift
//  BTProjects
//
//  Created by Dary Ramadhan on 06/11/23.
//

import SwiftUI

struct Ribbon: View {
    @Binding var order: Int
    var body: some View {
        ZStack {
            //Shadow Shape
            RibbonRectangle()
                .fill(Color.PB200)
                .frame(width: 64, height: 46)
                .rotationEffect(.degrees(90))
                .offset(x:6, y: -10)

            Triangle()
                .fill(Color.PB200)
                .frame(width: 10, height: 23)
                .rotationEffect(.degrees(90))
                .offset(x: -1.5, y: 25)
            
            Triangle()
                .fill(Color.PB200)
                .frame(width: 23, height: 10
                )
                .rotationEffect(.degrees(-180))
                .offset(x: 17.5, y: 25)
            
            //Text
            Text("\(order)")
                .foregroundColor(.white)
                .zIndex(4)
                .padding(.bottom, 20)
                .font(.Heading2_Medium)
            
            
            //Main Shape (Orange)
            RibbonRectangle()
                .fill(Color.orange3)
                .frame(width: 60, height: 46)
                .rotationEffect(.degrees(90))
                .offset(y: -12)
            
            Triangle()
                .fill(Color.orange3)
                .frame(width: 10, height: 23)
                .rotationEffect(.degrees(90))
                .offset(x: -11.5, y: 23)
            
            Triangle()
                .fill(Color.orange3)
                .frame(width: 23, height: 10
                )
                .rotationEffect(.degrees(-180))
                .offset(x: 11.5, y: 23)
            
            
        }
    }
}

struct RibbonRectangle: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.minX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.closeSubpath()
        return path
    }
}

struct Triangle: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.minX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.closeSubpath()
        return path
    }
}

#Preview {
    Ribbon(order: .constant(1))
}
