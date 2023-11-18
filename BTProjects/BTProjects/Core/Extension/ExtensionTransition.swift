//
//  ExtensionTransition.swift
//  BTProjects
//
//  Created by Sarah Uli Octavia on 19/11/23.
//

import SwiftUI

extension AnyTransition {
    static var moveAndFade: AnyTransition {
        .asymmetric(
            insertion: .move(edge: .trailing).combined(with: .opacity),
            removal: .move(edge: .leading).combined(with: .opacity)
        )
    }
}
