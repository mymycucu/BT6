//
//  SummaryHeader.swift
//  BTProjects
//
//  Created by Sarah Uli Octavia on 07/11/23.
//

import SwiftUI

struct SummaryHeader: View {
    var body: some View {
        HStack(spacing: 15){
            Button(action: {
                // Your action here
            }) {
                Image(systemName: "list.bullet")
                    .font(.Button)
            }
        .buttonStyle(CircularButtonStyle())
            ProgressBar()
            Button(action: {
                // Your action here
            }) {
                Image(systemName: "xmark")
                    .font(.Button)
            }
            .buttonStyle(CircularButtonStyle())
        }
        
    }
}

#Preview {
    SummaryHeader()
}
