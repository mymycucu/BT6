//
//  ExtensionFonts.swift
//  BTProjects
//
//  Created by Ario Syahputra on 24/10/23.
//

import SwiftUI

extension Font {
    
    // MARK: Heading 1
    static var Heading1_Semibold = Font.custom("Fredoka-SemiBold", size: 48)
    static var Heading1_Medium = Font.custom("Fredoka-Medium", size: 48)
    
    // MARK: Heading 2
    static var Heading2_Semibold = Font.custom("Fredoka-SemiBold", size: 36)
    static var Heading2_Medium = Font.custom("Fredoka-Medium", size: 36)
    static var Heading2_Regular = Font.custom("Fredoka-Regular", size: 36)
    
    // MARK: Subhead 1
    static var Subhead1_Semibold = Font.custom("Fredoka-SemiBold", size: 28)
    static var Subhead1_Medium = Font.custom("Fredoka-Medium", size: 28)
    static var Subhead1_Regular = Font.custom("Fredoka-Regular", size: 28)
    
    // MARK: Body
    static var Body_Semibold = Font.custom("Fredoka-SemiBold", size: 24)
    static var Body_Medium = Font.custom("Fredoka-Medium", size: 24)
    static var Body_Regular = Font.custom("Fredoka-Regular", size: 24)
    
    // MARK: Caption
    static var Caption_Semibold = Font.custom("Fredoka-SemiBold", size: 20)
    static var Caption_Medium = Font.custom("Fredoka-Medium", size: 20)
    static var Caption_Regular = Font.custom("Fredoka-Regular", size: 20)
    
    // MARK: Button
    static var Button = Font.system(size: 20, weight: .bold)
    
}
