//
//  dotLottieView.swift
//  BTProjects
//
//  Created by Ario Syahputra on 22/11/23.
//

import SwiftUI
import Lottie

struct dotLottieView: UIViewRepresentable {
    
    let url: URL
    
    func makeUIView(context: Context) -> some UIView {
        UIView()
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        let animationView = LottieAnimationView()
        animationView.translatesAutoresizingMaskIntoConstraints = false
        uiView.addSubview(animationView)
        
        NSLayoutConstraint.activate([
            animationView.widthAnchor.constraint(equalTo: uiView.widthAnchor),
            animationView.widthAnchor.constraint(equalTo: uiView.heightAnchor)
        ])
        
        DotLottieFile.loadedFrom(url: url) { result in
            
            switch result {
                case .success(let success):
                    animationView.loadAnimation(from: success)
                    animationView.loopMode = .loop
                    animationView.play()
                case .failure(let failure):
                    print(failure)
                
            }
            
        }
        
        
    }
}

