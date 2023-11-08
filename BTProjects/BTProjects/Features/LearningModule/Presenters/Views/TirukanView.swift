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
                    TirukanVideo()
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


