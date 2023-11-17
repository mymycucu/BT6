//
//  TripleChoiceVideo.swift
//  BTProjects
//
//  Created by Ario Syahputra on 10/11/23.
//

import SwiftUI
import AVKit

struct TripleChoiceVideo: View {
    @State private var isVideoFinished = false
    @State private var player: AVPlayer? = nil
    
    var videoURL: String

    var body: some View {
        
        
        ZStack {
            
            //MARK: Video Container
            
            if let player = player {
                VideoPlayerController(player: player)
                    .frame(width: 463, height: 306)
                    .cornerRadius(22)
                    .overlay(
                        RoundedRectangle(cornerRadius: 28)
                            .stroke(Color.Blue1, lineWidth: 6) // Use your desired stroke color
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

//#Preview {
//    TripleChoiceVideo()
//}
