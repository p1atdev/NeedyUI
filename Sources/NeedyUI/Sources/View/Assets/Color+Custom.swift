//
//  File.swift
//  
//
//  Created by p1atdev on 2022/07/01.
//

import Foundation
import SwiftUI

public extension Color {
    
    static let needyAccentPurple = Color("accentPurple", bundle: .module)
    static let needyHighlightWhite = Color("highlightWhite", bundle: .module)
    static let needyNormalBackground = Color("normalBackground", bundle: .module)
    static let needyWindowBackground = Color("windowBackground", bundle: .module)
    
}

public extension ShapeStyle where Self == Color {
    
    static var needyAccentPurple: Color {
        get {
            Color.needyAccentPurple
        }
    }
    static var needyHighlightWhite: Color {
        get {
            Color.needyHighlightWhite
        }
    }
    static var needyNormalBackground: Color {
        get {
            Color.needyNormalBackground
        }
    }
    static var needyWindowBackground: Color {
        get {
            Color.needyWindowBackground
        }
    }
}
