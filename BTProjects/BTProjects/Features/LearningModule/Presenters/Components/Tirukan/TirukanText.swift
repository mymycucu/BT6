//
//  TirukanText.swift
//  BTProjects
//
//  Created by Ario Syahputra on 07/11/23.
//

import SwiftUI

struct TirukanText: View {
    var body: some View {
        Text("Mari tirukan kata dibawah ini")
            .font(.Subhead1_Medium)
            .foregroundColor(.white)
        
        //MARK: Tirukan Text Target
        Text("bahaya")
            .font(.Heading1_Semibold)
            .underline()
            .foregroundColor(.white)
        
        
    }
}

#Preview {
    TirukanText()
}
