//
//  TirukanCamera.swift
//  BTProjects
//
//  Created by Ario Syahputra on 07/11/23.
//

import SwiftUI

struct TirukanCamera: View {
    @State private var classifiedSign = "None"
    @State private var isDone = false
    @State var progress: Double = 0
    
    var body: some View {
        ZStack{
            
            // MARK: Sign language video capture
            VStack(alignment: .center, spacing: 12) {
                VStack {
                    ARSCNCameraContainer(classifiedSign: $classifiedSign, progress: $progress, isDone: $isDone, sign: "O")
                        .cornerRadius(20)
                }
                .frame(width: 630, height: 420)
            }
            .padding(8)
            .cornerRadius(28)
            .overlay(
                RoundedRectangle(cornerRadius: 28)
                .inset(by: 1.35)
                .stroke(Color.white, style: StrokeStyle(lineWidth: 2.71, dash: [10.3, 10.3]))
            )
            
        }
    }
}



























