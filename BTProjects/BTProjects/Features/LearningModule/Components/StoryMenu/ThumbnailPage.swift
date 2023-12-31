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
    @State var isRead: Bool
    
    var body: some View {
        ZStack {
            Image(imageTitle)
                .resizable()
                .scaledToFill()
                .frame(width: 316, height: 230)
                .clipShape(RoundedRectangle(cornerRadius: 16))
                .zIndex(1)
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .fill(Color.black.opacity(isSelect ? 0 : isRead ? 0 : 0.5))
                )
            
            Ribbon(order: order)
                .offset(x: -100, y:-73)
                .zIndex(3)
            
            /// order - 1 because data from menu  order + 1
            if isSelect{
                RoundedRectangle(cornerRadius: 16)
                    .frame(width: 316, height: 230)
                    .opacity(0)
                    .overlay(
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(Color.Orange5, lineWidth: 7)
                    )
                    .zIndex(4)
            }
            
        }
    }
}

#Preview {
    ThumbnailPage(isSelect: false, order: 1 , imageTitle: "mencari-kumbang", isRead: true)
}
