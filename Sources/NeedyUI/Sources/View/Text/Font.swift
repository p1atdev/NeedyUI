//
//  File.swift
//  
//
//  Created by p1atdev on 2022/07/01.
//

import Foundation
import SwiftUI


public struct DotFont {
    
    public static func registerFonts() {
        DotGothic16.allCases.forEach {
            registerFont(bundle: .module, fontName: $0.rawValue, fontExtension: "ttf")
        }
    }
    
    fileprivate static func registerFont(bundle: Bundle, fontName: String, fontExtension: String) {
        
        guard let fontURL = bundle.url(forResource: fontName,
                                       withExtension: fontExtension),
            let fontDataProvider = CGDataProvider(url: fontURL as CFURL),
            let font = CGFont(fontDataProvider) else {
                fatalError("Couldn't create font from filename: \(fontName) with extension \(fontExtension)")
        }
        
        var error: Unmanaged<CFError>?

        CTFontManagerRegisterGraphicsFont(font, &error)
    }
    
}

struct DotFont_Previews: PreviewProvider {
    
    init() {
        DotFont.registerFonts()
    }
    
    static var previews: some View {
        Text("Hello, world!")
            .font(.dotGothicRegular)
    }
}
