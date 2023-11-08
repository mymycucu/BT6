//
//  StoryView.swift
//  BTProjects
//
//  Created by Ario Syahputra on 25/10/23.
//

import SwiftUI

struct StoryView: View {
    var body: some View {
        
        ZStack {
            
            StoryBackground()
                .padding(.top,20)
                
            VStack {
                
                StoryTopBar()
                    .padding(.horizontal, 30)
                
                StoryVideo()
                        .offset(x: 330, y: 0)
                        .padding(.vertical, 80)
                
                StoryBottomBar()
                    .padding(5)
            }
            .padding(.top, 30)
            
        }
    
    }
}

#Preview {
    StoryView()
}
