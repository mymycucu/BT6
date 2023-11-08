//
//  TirukanView.swift
//  BTProjects
//
//  Created by Ario Syahputra on 07/11/23.
//

import SwiftUI

struct TirukanView: View {
    var body: some View {
        
        ZStack {
            
            TirukanBackground()

            VStack {
                TirukanTopBar()
                    .padding(.horizontal, 30)

                TirukanText()
                
                HStack {
                    
                    // MARK: Sign language video
                    TirukanVideo()
                        .padding()
                    
                    // MARK: Sign language video capture
                    TirukanCamera()
                }
                
                
                TirukanBottomBar()
                    .padding(.horizontal, 30)
            }
        }
    }
}

#Preview {
    TirukanView()
}


