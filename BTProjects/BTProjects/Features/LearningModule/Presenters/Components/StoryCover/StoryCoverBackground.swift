//
//  StoryCoverBackground.swift
//  BTProjects
//
//  Created by Ario Syahputra on 12/11/23.
//

import SwiftUI

struct StoryCoverBackground: View {
    var body: some View {
        ZStack{
            RadialGradient(
                gradient: Gradient(
                    stops: [
                        .init(color: .PB600.opacity(0.8), location: 0), // Starting around $0% from the center
                        .init(color: .PB600, location: 0.8) // Strating 0.8
                    ]
                ),
                center: UnitPoint(x: 0.5, y: 1.5),
                startRadius: 0,
                endRadius: 1500
            )
            .edgesIgnoringSafeArea(.all)
            Image("stars_background")
                .resizable()
                .scaledToFit()
                .edgesIgnoringSafeArea(.all)
            
        }
    }
}

#Preview {
    StoryCoverBackground()
}
