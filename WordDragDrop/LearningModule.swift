//
//  LearningModule.swift
//  WordDragDrop
//
//  Created by Sarah Uli Octavia on 10/10/23.
//


import SwiftUI

struct LearningModule: View {
    // MARK: Properties
    @State var progress: CGFloat = 0
    @State var words: [Word] = words_
    
    var body: some View {
        VStack(spacing:30){
            NavBar()
            Rectangle()
                .fill(Color.orange)
                .frame(height: 200)
                .cornerRadius(20)
            Spacer()
        }
        .padding(30)
    }
    
    // MARK: Drag Area
    @ViewBuilder
    func DragArea() -> some View{
        VStack(spacing: 12){
            
        }
    }
    
    
    // MARK: Custom NavBar
    @ViewBuilder
    func NavBar() -> some View {
        HStack(spacing:15){
            
            Button{
                
            }label: {
                Image(systemName: "xmark")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .foregroundColor(.gray)
            }
            
            GeometryReader{ proxy in
                ZStack(alignment: .leading){
                    Capsule()
                        .fill(.gray.opacity(0.25))
                    Capsule()
                        .fill(.green)
                        .frame(width: proxy.size.width * progress)
                }
            }
            .frame(height: 30)
            
            Button{
                
            }label: {
                Image(systemName: "questionmark.circle")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .foregroundColor(.gray)
            }
        }
    }
    
    
    
}

#Preview {
    LearningModule()
}

