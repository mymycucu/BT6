//
//  Word.swift
//  WordDragDrop
//
//  Created by Sarah Uli Octavia on 10/10/23.
//

import Foundation

// MARK : Words Model

struct Word: Identifiable, Hashable, Equatable {
    var id = UUID().uuidString
    var value: String
    var padding: CGFloat = 10
    var textSize: CGFloat = .zero
    var fontSize: CGFloat = 19
    var isShowing: Bool = false
}

var words_ : [Word] = [
    Word(value: "Saya"),
    Word(value: "Melukis"),
    Word(value: "Bunga"),
//    Word(value: "Yang"),
//    Word(value: "Diberikan"),
//    Word(value: "Oleh"),
//    Word(value: "Dary"),
]
