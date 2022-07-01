//
//  File.swift
//  
//
//  Created by p1atdev on 2022/07/01.
//

// thanks: https://github.com/JZDesign/CustomFontSwiftUIExample/

import Foundation
import SwiftUI

public enum DotGothic16: String, CaseIterable {
    case regular400 = "DotGothic16-Regular"
}

public extension Font.TextStyle {
    var size: CGFloat {
        switch self {
        case .largeTitle: return 60
        case .title: return 48
        case .title2: return 34
        case .title3: return 24
        case .headline, .body: return 18
        case .subheadline, .callout: return 16
        case .footnote: return 14
        case .caption, .caption2: return 12
        @unknown default:
            return 8
        }
    }
}

public extension Font {
    private static func custom(_ font: DotGothic16, relativeTo style: Font.TextStyle) -> Font {
        custom(font.rawValue, size: style.size, relativeTo: style)
    }

    static let dotGothicLargeTitle = custom(.regular400, relativeTo: .title)
    static let dotGothicTitle = custom(.regular400, relativeTo: .title)
    static let dotGothicTitle2 = custom(.regular400, relativeTo: .title2)
    static let dotGothicTitle3 = custom(.regular400, relativeTo: .title3)
    static let dotGothicRegular = custom(.regular400, relativeTo: .body)
    
}
