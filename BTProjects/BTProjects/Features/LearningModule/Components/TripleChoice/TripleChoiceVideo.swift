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
//                    .padding(8)
                    .overlay(
                        RoundedRectangle(cornerRadius: 28)
                            .stroke(Color.Blue1, lineWidth: 7) // Use your desired stroke color
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
                    ZStack {
                        Circle()
                            .foregroundColor(.white)
                            .frame(width: 44, height: 44)
                            .overlay(
                                RoundedRectangle(cornerRadius: 100)
                                .inset(by: 1)
                                .stroke(Color.PB500, lineWidth: 2)

                            )
                        Image("replay")
                    }
//                    .offset(x: 200, y: -110) // Adjust replay position
                }
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