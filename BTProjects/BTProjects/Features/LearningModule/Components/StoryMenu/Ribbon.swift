//
//  RibbonPage.swift
//  BTProjects
//
//  Created by Dary Ramadhan on 06/11/23.
//

import SwiftUI

struct Ribbon: View {
    var order: Int
    var body: some View {
        ZStack {
            //MARK: Shadow Shape
            RibbonRectangle()
                .fill(Color.white.opacity(0.7))
                .frame(width: 46, height: 64)
                .offset(x:4, y: -10)
            
            Triangle()
                .fill(Color.white.opacity(0.7))
                .frame(width: 10, height: 23)
                .rotationEffect(.degrees(90))
                .offset(x: -6.5, y: 27)
            
            Triangle()
                .fill(Color.white.opacity(0.7))
                .frame(width: 23, height: 10
                )
                .rotationEffect(.degrees(-180))
                .offset(x: 15.5, y: 27)
            
            //MARK: Ribbon
            RibbonRectangle()
                .fill(Color.Orange5)
                .frame(width: 60, height: 46)
                .rotationEffect(.degrees(90))
                .offset(y: -12)
            
            Triangle()
                .fill(Color.Orange5)
                .frame(width: 10, height: 23)
                .rotationEffect(.degrees(90))
                .offset(x: -11.5, y: 23)
            
            Triangle()
                .fill(Color.Orange5)
                .frame(width: 23, height: 10
                )
                .rotationEffect(.degrees(-180))
                .offset(x: 11.5, y: 23)
            
            //MARK: Numbering
            Text("\(order)")
                .foregroundColor(.white)
                .padding(.bottom, 20)
                .font(.Heading2_Medium)
            
            
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
    Ribbon(order: 3)
}
