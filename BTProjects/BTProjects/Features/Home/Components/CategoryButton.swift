//
//  CategoryButton.swift
//  BTProjects
//
//  Created by Sarah Uli Octavia on 06/11/23.
//

import SwiftUI

struct CategoryButton: View {
    @State var category: Category?
    @State var item: Cat = Cat(id: 1, colors: .red)
    @State var action: () -> Void
    
    var body: some View {
        GeometryReader{ geo in
            Circle()
                .fill(item.colors)
                .overlay(
                    Circle()
                        .inset(by: 1)
                        .stroke(Color.PB300, lineWidth: 3)
                )
        }
    }
}

#Preview {
    CategoryButton(action: {})
}
