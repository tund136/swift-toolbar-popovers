//
//  Popover.swift
//  ToolbarPopovers
//
//  Created by Danh Tu on 14/10/2021.
//

import Foundation
import SwiftUI

// Creating extension for popover
extension View {
    func toolbarPopover<Content: View>(show: Binding<Bool>, placement: Placement = .leading, @ViewBuilder content: @escaping () -> Content) -> some View {
        self
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .overlay(
                ZStack {
                    if show.wrappedValue {
                        content()
                            .padding()
                            .background(
                                Color.white.clipShape(PopoverArrowShape())
                            )
                        // Shadow
                            .shadow(color: Color.primary.opacity(0.05), radius: 5, x: 5, y: 5)
                            .shadow(color: Color.primary.opacity(0.05), radius: 5, x: -5, y: -5)
                            .padding(.horizontal, 35)
                        // Moving from top
                        // Approx top nav bar height
                            .offset(y: 55)
                            .offset(x: placement == .leading ? -20 : 20)
                    }
                    
                },
                alignment: placement == .leading ? .topLeading : .topTrailing
            )
    }
}

// Placement
enum Placement {
    case leading
    case trailing
}

// Custom Arrow Shape
struct PopoverArrowShape: Shape {
    func path(in rect: CGRect) -> Path {
        return Path { path in
            let pt1 = CGPoint(x: 0, y: 0)
            let pt2 = CGPoint(x: rect.width, y: 0)
            let pt3 = CGPoint(x: rect.width, y: rect.height)
            let pt4 = CGPoint(x: 0, y: rect.height)
            
            // Drawing Arcs with radius
            path.move(to: pt4)
            
            path.addArc(tangent1End: pt1, tangent2End: pt2, radius: 15)
            path.addArc(tangent1End: pt2, tangent2End: pt3, radius: 15)
            path.addArc(tangent1End: pt3, tangent2End: pt4, radius: 15)
            path.addArc(tangent1End: pt4, tangent2End: pt1, radius: 15)
            
            // Arrow
            path.addLine(to: CGPoint(x: 10, y: 0))
            
            path.addLine(to: CGPoint(x: 15, y: 0))
            path.addLine(to: CGPoint(x: 25, y: -15))
            path.addLine(to: CGPoint(x: 40, y: 0))
        }
    }
}
