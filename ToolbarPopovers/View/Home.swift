//
//  Home.swift
//  ToolbarPopovers
//
//  Created by Danh Tu on 14/10/2021.
//

import SwiftUI

struct Home: View {
    // Updating Popover Views
    @State private var showGraphicalDate: Bool = false
    @State private var showPicker: Bool = false
    
    var body: some View {
        NavigationView {
            List {
                Toggle(isOn: $showPicker) {
                    Text("Show Picker")
                }
                
                Toggle(isOn: $showGraphicalDate) {
                    Text("Show Graphical Date Picker")
                }
            }
            .navigationBarTitle("Popovers")
        }
    }
}

