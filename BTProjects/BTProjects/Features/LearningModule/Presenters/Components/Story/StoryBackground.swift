//
//  StoryContent.swift
//  BTProjects
//
//  Created by Ario Syahputra on 25/10/23.
//

import SwiftUI

struct StoryBackground: View {
    var body: some View {
        
        ZStack {
            
            //MARK: Illustration
            Image("illust_dummy")
                
            
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
        .aspectRatio(contentMode: .fit)
        .edgesIgnoringSafeArea(.all)
        
    }
    
    
}

#Preview {
    StoryBackground()
}
