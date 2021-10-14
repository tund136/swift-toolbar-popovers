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
                    }
                },
                alignment: .topLeading
            )
    }
}
