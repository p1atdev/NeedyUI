//
//  File.swift
//  
//
//  Created by p1atdev on 2022/07/01.
//

import Foundation
import SwiftUI

public struct NeedyButtonStyle: ButtonStyle {
    
    public func makeBody(configuration: Configuration) -> some View {
        configuration
            .label
            .font(.dotGothicRegular)
            .padding(6)
            .foregroundColor(.needyAccentPurple)
            .background(Color.needyNormalBackground)
            .border(width: 2,
                    edges: [.top, .leading],
                    color: !configuration.isPressed ? .needyHighlightWhite : .needyAccentPurple)
            .border(width: 2,
                    edges: [.trailing, .bottom],
                    color: !configuration.isPressed ? .needyAccentPurple : .needyHighlightWhite)
            .animation(.linear(duration: 0.001),
                       value: configuration.isPressed)
            
    }
    
}

struct NeedyButtonStyle_Previews: PreviewProvider {
    
    init() {
        DotFont.registerFonts()
    }
    
    static var previews: some View {
        VStack {
            Button {
                
            } label: {
                Text("SwiftUI")
                    .padding(.horizontal, 20)
            }
            .buttonStyle(NeedyButtonStyle())
        }
        .padding()
        .background(.needyNormalBackground)
        
    }
}
