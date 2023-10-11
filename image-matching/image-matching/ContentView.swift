//
//  ContentView.swift
//  image-matching
//
//  Created by Ario Syahputra on 06/10/23.
//

import SwiftUI

struct ContentView: View {
    @State private var animationIndex = 0
    @State private var animationNames = ["animation-test", "animation-test2","cat-hat-blue","cat-hat-brown","cat-hat-lilac","cat-hat-navy","cat-hat-red"]
    @State private var viewID = UUID() // Add a UUID to trigger view reload
    @State private var pageIndex = 0
    
    var body: some View {
        VStack {
            Text("Page index - \(pageIndex)")
                .font(.title)
                .bold()
            HStack {
                LottieView(name: animationNames[animationIndex], loopMode: .loop)
                    .id(viewID) // Assign the ID to trigger view reload
                    .frame(width: 450, height: 300)
                
                    .padding()
                LottieView(name: animationNames[animationIndex], loopMode: .loop)
                    .id(viewID) // Assign the ID to trigger view reload
                    .frame(width: 450, height: 300)
                    .padding()
            }
            
            Button(action: {
                // Change the animation index to the next one in the array
                animationIndex = (animationIndex + 1) % animationNames.count
                print(animationNames[animationIndex])
                viewID = UUID() // Update the ID to force view reload
                pageIndex += 1
            }) {
                Text("Next Animation")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding()
        }
        
    }
}


#Preview {
    ContentView()
}
