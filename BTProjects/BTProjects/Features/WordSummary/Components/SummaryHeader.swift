//
//  SummaryHeader.swift
//  BTProjects
//
//  Created by Sarah Uli Octavia on 07/11/23.
//

import SwiftUI

struct SummaryHeader: View {
    var body: some View {
        Button(action: {
            // Your action here
        }) {
            Image(systemName: "list.bullet")
                .font(.Button)
//                .frame(width: 62, height: 62) // Set the image size
        }
        .buttonStyle(CircularButtonStyle())
    }
}

#Preview {
    SummaryHeader()
}
