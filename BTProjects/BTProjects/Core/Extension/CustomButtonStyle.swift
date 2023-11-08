//
//  CustomButtonStyle.swift
//  BTProjects
//
//  Created by Sarah Uli Octavia on 08/11/23.
//

import Foundation
import SwiftUI

struct CircularButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(width: 62, height: 62) // Adjust size as needed
            .foregroundColor(Color.PB500)
            .background(Color.white)
            .clipShape(Circle()) // Clips the button label into a circular shape
            .overlay(
                Circle()
                    .inset(by: 1)
                    .stroke(Color.PB500, lineWidth: 3)
            )
        
    }
}

struct ReplayButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(width: 44, height: 44) // Adjust size as needed
            .foregroundColor(Color.PB500)
            .background(Color.white)
            .clipShape(Circle()) // Clips the button label into a circular shape
            .overlay(
                Circle()
                    .inset(by: 1)
                    .stroke(Color.PB500, lineWidth: 2)
            )
        
    }
}
