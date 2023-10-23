//
//  Mp4Controller.swift
//  WordDragDrop
//
//  Created by Ario Syahputra on 12/10/23.
//

import SwiftUI
import AVKit

struct VideoPlayerRepresented: UIViewControllerRepresentable {
    var url: URL

    func makeUIViewController(context: Context) -> AVPlayerViewController {
        let playerViewController = AVPlayerViewController()
        let player = AVPlayer(url: url)
        playerViewController.player = player

        // Hide playback controls
        playerViewController.showsPlaybackControls = false
        
        // Mute the video
        player.isMuted = true


        // Autoplay and loop
        player.play()
        player.actionAtItemEnd = .none
        NotificationCenter.default.addObserver(forName: .AVPlayerItemDidPlayToEndTime, object: player.currentItem, queue: .main) { _ in
            player.seek(to: CMTime.zero)
            player.play()
        }

        return playerViewController
    }

    func updateUIViewController(_ uiViewController: AVPlayerViewController, context: Context) {
        // Update the view controller if needed
    }
}

