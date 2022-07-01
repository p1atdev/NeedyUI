//
//  SwiftUIView.swift
//  
//
//  Created by p1atdev on 2022/07/01.
//

import SwiftUI

struct NeedyWindowTitleBar: View {
    
    @State var title: String
    
    var onMinimize: () -> Void
    
    var onMaximize: () -> Void
    
    var onClose: () -> Void
    
    var body: some View {
        HStack(spacing: 3) {
            Text(title)
                .font(.dotGothicRegular)
                .padding(1)
                .foregroundColor(.needyAccentPurple)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Spacer()
            
            Button {
                onMinimize()
            } label: {
                Image.needyMinimizeIcon
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(.needyAccentPurple)
            }
            
            Button {
                onMaximize()
            } label: {
                Image.needyMaximizeIcon
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(.needyAccentPurple)
            }
            
            Button {
                onClose()
            } label: {
                Image.needyCloseIcon
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(.needyAccentPurple)
            }
                
        }
        .frame(height: 16)
        .padding(2)
        .background(.needyNormalBackground)
        .padding(2)
        .border(.needyAccentPurple, width: 2)
        
    }
}

struct NeedyWindowTitleBar_Previews: PreviewProvider {
    static var previews: some View {
        NeedyWindowTitleBar(title: "ウィンドウ") {
            
        } onMaximize: {
            
        } onClose: {
            
        }
            .padding()
    }
}
