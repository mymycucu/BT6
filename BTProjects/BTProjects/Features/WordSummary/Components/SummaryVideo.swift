//
//  SummaryVideo.swift
//  BTProjects
//
//  Created by Sarah Uli Octavia on 08/11/23.
//

import SwiftUI
import AVKit


struct SummaryVideo: View {
    @State private var isVideoFinished = false
    @State private var player: AVPlayer? = nil
    
    var body: some View {
        ZStack {
            
            //MARK: Video Container
            
            if let player = player {
                VideoPlayerController(player: player)
                    .frame(width: 467, height: 310)
                    .cornerRadius(22)
                    .padding(6)
                    .overlay(
                        RoundedRectangle(cornerRadius: 22)
                            .inset(by: 1)
                            .stroke(Color(red: 0.95, green: 0.95, blue: 0.97), style: StrokeStyle(lineWidth: 2, dash: [7.5907368659973145, 7.5907368659973145]))
                        
                    )
                    .shadow(color: Color.white.opacity(0.3), radius: 5, x: 0, y: 5)
                
            }
            
            //MARK: Replay Button
            
            VStack(alignment: .trailing){
                if !isVideoFinished {
                    HStack {
                        Spacer()
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
                    .padding(15)
                }
                Spacer()
            }
            .frame(width: 467, height: 310)
        }
        .onAppear {
            
            //MARK: Video Path
            
            let url = URL(fileURLWithPath: Bundle.main.path(forResource: "E_Bisindo", ofType: "mp4")!)
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
    SummaryVideo()
}
