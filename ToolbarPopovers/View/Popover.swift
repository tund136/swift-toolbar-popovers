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
    func toolbarPopover<Content: View>(show: Binding<Bool>, @ViewBuilder content: @escaping () -> Content) -> some View {
        self
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .overlay(
                ZStack {
                    if show.wrappedValue {
                        content()
                            .padding()
                            .background(Color.white.cornerRadius(15))
                            .padding(.horizontal, 35)
                        // Moving from top
                        // Approx top nav bar height
                            .offset(x: -20, y: 55)
                    }
                    
                },
                alignment: .topLeading
            )
    }
}
