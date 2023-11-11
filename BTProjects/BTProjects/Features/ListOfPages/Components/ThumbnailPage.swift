//
//  ThumbnailPage.swift
//  BTProjects
//
//  Created by Dary Ramadhan on 06/11/23.
//

import SwiftUI

struct ThumbnailPage: View {
    
    @Binding var isSelect: Int
    @State var order: Int
    var imageTitle: String = "story-1"
    
    var isActive: Bool = false
    
    var body: some View {
        ZStack {
            Image(imageTitle)
                .frame(width: 316, height: 230)
                .clipShape(RoundedRectangle(cornerRadius: 16))
                .zIndex(1)
            RibbonPage(order: $order)
                .offset(x: -100, y:-73)
                .zIndex(3)
            
            if isSelect == order {
                Rectangle()
                    .frame(width: 316, height: 230)
                    .opacity(0)
                    .border(Color.Orange3, width: 7)
                    .cornerRadius(12)
                    .zIndex(4)
            }
            
        }
    }
}

#Preview {
    ThumbnailPage(isSelect: .constant(1), order: 1)
}
