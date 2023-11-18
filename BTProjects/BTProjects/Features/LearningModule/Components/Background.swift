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
    var viewState: ViewState
    var illustration: String
    @State private var opacity: Double = 0.9
    
    init(viewState: ViewState) {
        self.viewState = viewState
        self.illustration =  "background"
    }
    
    init(viewState: ViewState, illustration: String) {
        self.viewState = viewState
        self.illustration =  illustration
    }
    
    var body: some View {
        ZStack{
            if viewState == .story {
                //MARK: Illustration
                Group{
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
                }
                .opacity(opacity)
                .onAppear {
                    withAnimation(.easeInOut(duration: 0.5)) {
                        self.opacity = 1.0
                    }
                }
                
            } else if viewState == .summary{
                Group {
                    //MARK: Illustration
                    Image(illustration)
                        .resizable()
                        .scaledToFill()
                    
                    Rectangle()
                        .fill(Color.Overlay2.opacity(0.6))
                        .edgesIgnoringSafeArea(.all)
                }
                .opacity(opacity)
                .onAppear {
                    withAnimation(.easeInOut(duration: 0.5)) {
                        self.opacity = 1.0
                    }
                }
                
                
            } else {
                Group{
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
            
        }
        .aspectRatio(contentMode: .fill)
        .edgesIgnoringSafeArea(.all)
    }
}

//#Preview {
//    Background()
//}
