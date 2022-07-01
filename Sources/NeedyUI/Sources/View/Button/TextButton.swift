//
//  SwiftUIView.swift
//  
//
//  Created by p1atdev on 2022/07/01.
//

import SwiftUI

public struct NeedyTextButton: View {
    
    @State var text: String
    var action: () -> Void
    
    public var body: some View {
        Button {
            action()
        } label: {
            Text(text)
        }
        .buttonStyle(NeedyButtonStyle())
    }
}

struct NeedyTextButton_Previews: PreviewProvider {
    static var previews: some View {
        NeedyTextButton(text: "Hello") {
            print("hi")
        }
    }
}
