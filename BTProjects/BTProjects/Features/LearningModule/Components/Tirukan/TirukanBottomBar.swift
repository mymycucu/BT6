//
//  TirukanBottomBar.swift
//  BTProjects
//
//  Created by Ario Syahputra on 07/11/23.
//

import SwiftUI

struct TirukanBottomBar: View {
    @Binding var isOverlayVisible: Bool // Add a binding to control the overlay's visibility

    var body: some View {
        HStack {
            Spacer()
            
            // MARK: Next Button
            Button(action: {
                // Toggle the overlay's visibility when the "Next" button is clicked
                withAnimation {
                    isOverlayVisible.toggle()
                }
            }) {
                HStack(alignment: .center, spacing: 0) {
                    Image(systemName: "arrowshape.right.fill")
                        .imageScale(.large)
                        .foregroundColor(Color.PB500)
                }
                .frame(width: 62, height: 62)
                .background(Color.white)
                .cornerRadius(100)
                .overlay(
                    RoundedRectangle(cornerRadius: 100)
                        .inset(by: 1.5)
                        .stroke(Color.PB500, lineWidth: 3)
                )
            }
        }
    }
}


//#Preview {
//    TirukanBottomBar()
//}
