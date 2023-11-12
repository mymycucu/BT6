//
//  StoryHeader.swift
//  BTProjects
//
//  Created by Sarah Uli Octavia on 12/11/23.
//

import SwiftUI

struct StoryHeader: View {
    var body: some View {
        HStack(spacing: 15){
            Button(action: {
                
            }) {
                Image(systemName: "list.bullet")
                    .font(.Button)
            }
            .buttonStyle(CircularButtonStyle())
            Spacer()
            Button(action: {
                
            }) {
                Image(systemName: "xmark")
                    .font(.Button)
            }
            .buttonStyle(CircularButtonStyle())
        }
    }
}

#Preview {
    StoryHeader()
}
