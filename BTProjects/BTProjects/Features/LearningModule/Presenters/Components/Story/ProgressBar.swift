//
//  ProgressBar.swift
//  BTProjects
//
//  Created by Ario Syahputra on 25/10/23.
//

import SwiftUI

//struct ProgressBar: View {
//    var body: some View {
//        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
//    }
//}

//#Preview {
//    ProgressBar()
//}

import SwiftUI

struct ProgressBar: View {
    @State private var progress: CGFloat = 0
    @State private var currentCheckpoint = 0
    let totalCheckpoints = 6 // Set the total number of checkpoints

    var body: some View {
        HStack(spacing: 15) {
            GeometryReader { proxy in
                ZStack(alignment: .leading) {
                    Capsule()
                        .fill(Color.gray.opacity(0.25))
                        .frame(height: 22)
                    Capsule()
                        .fill(Color.orange)
                        .frame(width: proxy.size.width * progress, height: 22)
                }
            }
            .frame(height: 30)

            Button(action: {
                moveToNextCheckpoint()
            }) {
                ZStack {
                    Circle()
                        .fill(Color(.systemGray6))
                        .frame(width: 42, height: 42)

                    Image(systemName: "xmark")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 20, height: 20)
                        .foregroundColor(Color.PB500)
                }
            }
        }
        .padding(20)
    }

    // Move to the next checkpoint and update the progress
    func moveToNextCheckpoint() {
        if currentCheckpoint < totalCheckpoints {
            withAnimation(.easeInOut) {
                currentCheckpoint += 1
                progress = CGFloat(currentCheckpoint) / CGFloat(totalCheckpoints)
                // Optionally, you can add custom actions when a checkpoint is reached
            }
           
        }
    }
}


#Preview {
    ProgressBar()
}
