//
//  VideoPlayerController.swift
//  BTProjects
//
//  Created by Hilmy Noerfatih on 10/11/23.
//

import AVKit
import SwiftUI
import UIKit

struct VideoPlayerController: UIViewControllerRepresentable {
    var player: AVPlayer

    func makeUIViewController(context: Context) -> AVPlayerViewController {
        let controller = AVPlayerViewController()
        controller.player = player
        controller.showsPlaybackControls = false
        
        // Set videoGravity to .resize to make the video stretch to fit the frame
        controller.videoGravity = .resizeAspectFill

        // Delay for 0.8 seconds and then play the video
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
            player.play()
        }

        if #available(iOS 16.0, *) {
            controller.allowsVideoFrameAnalysis = false
        }
        
        
        return controller
    }

    func updateUIViewController(_ uiViewController: AVPlayerViewController, context: Context) {
        // Update the view controller if needed
    }
}
