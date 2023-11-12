//
//  CategoryMenu.swift
//  BTProjects
//
//  Created by Sarah Uli Octavia on 06/11/23.
//

import SwiftUI

struct CategoryMenu: View {
    let categories = [Cat(colors: .red),Cat(colors: .cyan),Cat(colors: .yellow),
                      Cat(colors: .orange),Cat(colors: .blue),Cat(colors: .purple),
                      Cat(colors: .green),]
    @Binding var category: Cat?
    @State private var selectedCategoryIndex = 0 // Index of the initially selected category'
    @State var scrollID: Int?
    
    var body: some View {
        
        ScrollViewReader { proxy in
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(spacing: 10) {
                    Circle()
                        .frame(height: 90)
                        .overlay(
                            RoundedRectangle(cornerRadius: 100)
                                .inset(by: 1.5)
                                .stroke(Color(red: 0.19, green: 0.24, blue: 0.35), lineWidth: 3)
                        )
                        .opacity(0)
                    Circle()
                        .frame(height: 90)
                        .overlay(
                            RoundedRectangle(cornerRadius: 100)
                                .inset(by: 1.5)
                                .stroke(Color(red: 0.19, green: 0.24, blue: 0.35), lineWidth: 3)
                        )
                        .opacity(0)
                    ForEach(0..<min(categories.count, 9), id: \.self) { index in
                        
                        let scale = calculateScale(index: index)
                        Button {
                            scrollID = index
                        } label: {
                            Circle()
                                .fill(categories[index].colors)
                            
                            
                        }
                        .overlay(
                            RoundedRectangle(cornerRadius: 100)
                                .inset(by: 1)
                                .stroke(Color.PB300, lineWidth: 3)
                        )
                        
                        .scaleEffect(scale, anchor: .center)
                        
                        .onAppear {
                            if index == 0 {
                                withAnimation {
                                    proxy.scrollTo(index)
                                }
                            }
                        }
                        .scrollTransition { content, phase in
                            content
                                .scaleEffect (
                                    x: phase.isIdentity ? 1.0 : 0,
                                    y: phase.isIdentity ? 1.0 : 0)
                        }
                        .frame(maxWidth: 90)
                    }
                    Circle()
                        .frame(height: 90)
                        .overlay(
                            RoundedRectangle(cornerRadius: 100)
                                .inset(by: 1.5)
                                .stroke(Color(red: 0.19, green: 0.24, blue: 0.35), lineWidth: 3)
                        )
                        .opacity(0)
                    Circle()
                        .frame(height: 90)
                        .overlay(
                            RoundedRectangle(cornerRadius: 100)
                                .inset(by: 1.5)
                                .stroke(Color(red: 0.19, green: 0.24, blue: 0.35), lineWidth: 3)
                        )
                        .opacity(0)
                    
                }
                .scrollTargetLayout()
            }
            
            .scrollTargetBehavior(.viewAligned)
            .scrollPosition(id: $scrollID, anchor: .center)
            .onAppear{
                withAnimation {
                    DispatchQueue.main.async{
                        scrollID = 0
                    }
                }
            }
            .onChange(of: scrollID) { oldValue, newValue in
                withAnimation(.easeInOut(duration: 0.1)) {
                    DispatchQueue.main.async{
                        proxy.scrollTo(newValue)
                    }
                }
            }
            .frame(width: 500, height: 100)
        }
        
    }
    func calculateScale(index: Int) -> CGFloat {
        let activeIndex = Int(scrollID ?? 0)
        var scale:CGFloat?
        withAnimation(.easeInOut(duration: 0.1)){
            if activeIndex == index {
                scale = 1.0
            } else if activeIndex - 1 == index || activeIndex + 1 == index {
                scale = 0.75
            } else {
                scale = 0.5
            }
        }
        return scale!
    }
    
}

#Preview {
    CategoryMenu(category: .constant(nil))
}
