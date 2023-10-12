//
//  PrimaryActiveButtonStyle.swift
//  WordDragDrop
//
//  Created by Sarah Uli Octavia on 12/10/23.
//

import SwiftUI

struct PrimaryActiveButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(width: 300, height: 50)
            .foregroundColor(Color.white)
            .background(Color.primary1)
            .font(.buttonFont)
            .cornerRadius(10)
        
    }
}
