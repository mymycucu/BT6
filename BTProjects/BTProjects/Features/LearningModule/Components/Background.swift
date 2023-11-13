//
//  Background.swift
//  BTProjects
//
//  Created by Sarah Uli Octavia on 13/11/23.
//

import SwiftUI

enum ViewState {
    case story
    case summary
    case quiz
    case normal
    
}


struct Background: View {
    @Binding var viewState: ViewState
    var illustration: String
    
    init(viewState: Binding<ViewState>) {
        _viewState = viewState
        self.illustration =  "background"
    }
    
    init(viewState: Binding<ViewState>, illustration: String) {
        _viewState = viewState
        self.illustration =  illustration
    }
    
    var body: some View {
        ZStack{
            if viewState == .story {
                //MARK: Illustration
                Image(illustration)
                    .resizable()
                    .scaledToFill()
                
                VStack {
                    
                    //MARK: Top Shadow
                    Rectangle()
                        .fill(LinearGradient(gradient: Gradient(colors: [Color.PB500.opacity(0.30), Color.PB500.opacity(0)]), startPoint: .center, endPoint: .bottom))
                        .frame(height: 100) // Adjust the height of the bottom shadow as needed
                    
                    Spacer()
                    
                    //MARK: Bottom Shadow
                    Rectangle()
                        .fill(LinearGradient(gradient: Gradient(colors: [Color.PB500.opacity(0.70), Color.PB500.opacity(0)]), startPoint: .bottom, endPoint: .center))
                        .frame(height: 100) // Adjust the height of the bottom shadow as needed
                }
            } else if viewState == .summary{
                //MARK: Illustration
                Image(illustration)
                    .resizable()
                    .scaledToFill()
                
                Rectangle()
                    .fill(Color.PB900.opacity(0.7))
                    .edgesIgnoringSafeArea(.all)
                
            } else {
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
                //            .edgesIgnoringSafeArea(.all)
                Image(illustration)
                    .resizable()
                    .scaledToFill()
                    .opacity(0.1)
            }
            
        }
        .aspectRatio(contentMode: .fill)
        .edgesIgnoringSafeArea(.all)
    }
}

//#Preview {
//    Background()
//}
