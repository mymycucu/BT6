//
//  VideoContainer.swift
//  BTProjects
//
//  Created by Ario Syahputra on 25/10/23.
//

import SwiftUI
import AVKit
import SwiftUI

struct StoryVideo: View {
    @State private var isVideoFinished = false
    @State private var player: AVPlayer? = nil
    
    var videoURL: String
    
    var body: some View {
        ZStack {
            //MARK: Video Container
            ///3D effect
            RoundedRectangle(cornerRadius: 22)
//                .foregroundColor(.clear)
                .fill(Color.PB500)
                .frame(width: 310, height: 400)
                .offset(x:4, y:4)
                .shadow(color: Color.white.opacity(0.3), radius: 2, x: 4, y: 4)
            
            if let player = player {
                VideoPlayerController(player: player)
                    .frame(width: 310, height: 400)
                    .cornerRadius(22)
                    .overlay(
                        RoundedRectangle(cornerRadius: 22)
                            .stroke(Color.PB500, lineWidth: 8) // Use your desired stroke color
                    )
            }
            
            //MARK: Replay Button
            if isVideoFinished {
                Button(action: {
                    // Start the video from the beginning
                    isVideoFinished = false
                    player?.seek(to: .zero)
                    player?.play()
                }) {
                    Image("replay")
                        .resizable()
                        .frame(width: 23, height: 23)
                }
                .buttonStyle(ReplayButtonStyle())
            }
        }
        .frame(width: 310, height: 400)
        .onAppear {
            
            //MARK: Video Path
            
            let url = URL(fileURLWithPath: Bundle.main.path(forResource: videoURL, ofType: "mp4")!)
            player = AVPlayer(url: url)
            
            player?.isMuted = true // Video condition is muted
            player?.play()
            player?.actionAtItemEnd = .pause // .pause for no replay .none for autoreplay
            
            NotificationCenter.default.addObserver(forName: .AVPlayerItemDidPlayToEndTime, object: player?.currentItem, queue: .main) { _ in
                isVideoFinished = true
            }
            
            NotificationCenter.default.addObserver(forName: UIApplication.willResignActiveNotification, object: nil, queue: .main) { _ in
                // App is going to the background, pause the video
                player?.pause()
            }
            
            NotificationCenter.default.addObserver(forName: UIApplication.didBecomeActiveNotification, object: nil, queue: .main) { _ in
                // App has become active, resume the video
                player?.play()
            }
        }
    }
}



#Preview {
    StoryVideo(videoURL: "E_Bisindo")
}

