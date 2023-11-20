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
            insertion: .opacity.combined(with: .move(edge: .trailing)),
            removal: .move(edge: .leading).combined(with: .opacity)
        )
    }
}
