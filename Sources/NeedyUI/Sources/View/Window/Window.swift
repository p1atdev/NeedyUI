//
//  SwiftUIView.swift
//  
//
//  Created by p1atdev on 2022/07/01.
//

import SwiftUI

public struct NeedyWindow<Content: View>: View, Identifiable {
    
    public let id = UUID()
    
    @State var title: String
    
    @State var initialSize: CGSize = CGSize(width: 240, height: 180)
    
    @State var size: CGSize = CGSize(width: 240, height: 180)
    
    @ViewBuilder var content: () -> Content
    
    var onMinimize: () -> Void
    
    var onMaximize: () -> Void
    
    var onClose: () -> Void
    
    @State private var isMaximized: Bool = false
    
    @State private var offset: CGPoint = .zero
    
    @State private var startDragLocation = CGPoint.zero
    @State private var endOffset = CGPoint.zero
    @State private var isBeginDrag = true
    
    private var dragGesture: some Gesture {
        DragGesture()
            .onChanged({ value in
                if isBeginDrag {
                    isBeginDrag = false
                    startDragLocation = value.location
                }
                
                offset =  CGPoint(x: endOffset.x + value.location.x - startDragLocation.x,
                                  y: endOffset.y + value.location.y - startDragLocation.y)
            })
            .onEnded({ value in
                isBeginDrag = true
                endOffset = CGPoint(x: offset.x,
                                    y: offset.y)
            })
    }
    
    public var body: some View {
            
            VStack(alignment: .leading, spacing: 2) {
                NeedyWindowTitleBar(title: title) {
                    onMinimize()
                } onMaximize: {
                    isMaximized.toggle()
                    onMaximize()
                } onClose: {
                    onClose()
                }
                .allowsHitTesting(true)
                
                ZStack {
                    Color.needyNormalBackground
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .allowsHitTesting(false)
                    
                    content()
                    
                }
                .padding(2)
                .border(.needyAccentPurple, width: 2)
                .padding(.bottom, 8)
                
            }
            
            .padding(2)
            .background {
                Color.needyWindowBackground
                    .allowsHitTesting(false)
                }
        .padding(2)
        .border(.needyAccentPurple, width: 2)
        .frame(width: isMaximized ? .infinity : size.width,
               height: isMaximized ? .infinity : size.height)
        
        .offset(CGSize(width: offset.x, height: offset.y))
        .gesture(dragGesture)
        
        .onAppear {
            size = initialSize
        }
        
        
    }
}

struct NeedyWindowPreview: View {
    
    @State private var isHidden: Bool = false
    
    @State private var isMaximized: Bool = false
    
    var dragGesture: some Gesture {
        DragGesture()
            .onChanged{ value in
            }
            .onEnded{ value in
            }
    }
    
    var body: some View {
        if !isHidden {
            VStack {
                NeedyWindow(title: "■メッセージ",
                            initialSize: .init(width: 320, height: 180)) {
                    VStack {
                        Text("ありがとう")
                            .font(.dotGothicRegular)
                            .padding()
                        
                        HStack {
                            NeedyButton {} label: {
                                Text("OK")
                                    .padding(.horizontal, 36)
                            }
                        }
                    }
                    
                } onMinimize: {
                    
                } onMaximize: {
                    isMaximized.toggle()
                } onClose: {
                    isHidden = true
                }
            }
            .ignoresSafeArea()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.needyNormalBackground)
            
        } else {
            Text("Nothing")
        }
    }
}

struct NeedyWindow_Previews: PreviewProvider {
    
    static var previews: some View {
        NeedyWindowPreview()
    }
}
