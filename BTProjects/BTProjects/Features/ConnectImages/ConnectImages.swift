//
//  ConnectImages.swift
//  BTProjects
//
//  Created by Sarah Uli Octavia on 08/11/23.
//

import SwiftUI

struct ConnectImages: View {
    @State var disableNext: Bool = true
    var body: some View {
        
        VStack(alignment: .center, spacing: 0){
            SummaryHeader()

            ZStack {
                HStack{
                    VStack{
                        ImageContainer()
                        ImageContainer()
                        ImageContainer()
                    }
                    Spacer()
                    VStack{
                        ImageContainer()
                        ImageContainer()
                        ImageContainer()
                    }
                }
                .padding(.horizontal, 122)
                .padding(.vertical, 37)
           
                VStack {
                    Spacer()
                    HStack{
                        Button(action: {
                            // Your action here
                        }) {
                            Image(systemName: "arrowshape.left.fill")
                                .font(.Button)
                        }
                        .buttonStyle(CircularButtonStyle())
                        
                        Spacer()
                        Button(action: {
                            // Your action here
                        }) {
                            Image(systemName: "arrowshape.right.fill")
                                .font(.Button)
                        }
                        .buttonStyle(CircularButtonStyle(disabled: disableNext))
                        
                        
                    }
                }
            }
            Spacer()
           
        }
        .padding(40)
        .background(
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
                Image("background")
                    .resizable()
                    .scaledToFit()
                    .opacity(0.1)
                    .edgesIgnoringSafeArea(.all)
                
                
            }
        
            
        )
    }
}

#Preview {
    ConnectImages()
}
