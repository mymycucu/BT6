//
//  ThumbnailPage.swift
//  BTProjects
//
//  Created by Dary Ramadhan on 06/11/23.
//

import SwiftUI

struct ThumbnailPage: View {
    
    var isSelect: Bool
    var order: Int
    var imageTitle: String
    
    var isActive: Bool = false
    
    var body: some View {
        ZStack {
            Image(imageTitle)
                .resizable()
                .scaledToFill()
                .frame(width: 316, height: 230)
                .clipShape(RoundedRectangle(cornerRadius: 16))
                .zIndex(1)
            Ribbon(order: order)
                .offset(x: -100, y:-73)
                .zIndex(3)
            
            /// order - 1 because data from menu  order + 1
            if isSelect{
                Rectangle()
                    .frame(width: 316, height: 230)
                    .opacity(0)
                    .border(Color.Orange4, width: 7)
                    .cornerRadius(12)
                    .zIndex(4)
            }
            
        }
    }
}

#Preview {
    ThumbnailPage(isSelect: true, order: 1 , imageTitle: "mencari-kumbang")
}
