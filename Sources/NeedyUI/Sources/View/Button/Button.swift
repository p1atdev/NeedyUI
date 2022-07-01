//
//  SwiftUIView.swift
//  
//
//  Created by p1atdev on 2022/07/01.
//

import SwiftUI

public struct NeedyButton<Label> : View where Label : View {
    
    var action: () -> Void
    @ViewBuilder var label: () -> Label
    
    public var body: some View {
        Button {
            action()
        } label: {
            label()
        }
        .buttonStyle(NeedyButtonStyle())
    }
}

struct NeedyButton_Previews: PreviewProvider {
    static var previews: some View {
        NeedyButton {
            print("NeedyButton")
        } label: {
            Text("NeedyButton")
        }
    }
}
