//
//  CategoryButton.swift
//  BTProjects
//
//  Created by Sarah Uli Octavia on 06/11/23.
//

import SwiftUI

struct CategoryButton: View {
    @State var category: Category?
    @State var item: Category = Category(colors: .red)
    @State var action: () -> Void
    
    var body: some View {
        VStack{
            Button(action: action){
                Circle()
                    .fill(item.colors)
                    .frame(height: 90)
                    .overlay(
                        Circle()
                            .inset(by: 1)
                            .stroke(Color.PB300, lineWidth: 3)
                    )
                
                    
            }
        }
    }
}

#Preview {
    CategoryButton(action: {})
}
