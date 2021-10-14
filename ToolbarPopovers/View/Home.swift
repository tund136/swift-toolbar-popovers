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
    @State private var show: Bool = false
    
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
            // Toolbar
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        withAnimation {
                            show.toggle()
                        }
                    }, label: {
                        Image(systemName: "slider.horizontal.below.square.fill.and.square")
                    })
                }
            }
        }
        .toolbarPopover(show: $show, placement: .leading) {
            // Popover View
            DatePicker("", selection: .constant(Date()))
                .datePickerStyle(.compact)
                .labelsHidden()
        }
    }
}

