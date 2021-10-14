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
            // Showing dynamic usage
            if showPicker {
                Picker(selection: .constant("")) {
                    ForEach(1...10, id: \.self) { index in
                        Text("Hello \(index)")
                            .tag(index)
                    }
                } label: {
                    
                }
                .labelsHidden()
                .pickerStyle(.wheel)
            } else {
                if showGraphicalDate {
                    // Popover View
                    DatePicker("", selection: .constant(Date()))
                        .datePickerStyle(.graphical)
                        .labelsHidden()
                } else {
                    // Popover View
                    DatePicker("", selection: .constant(Date()))
                        .datePickerStyle(.compact)
                        .labelsHidden()
                }
            }
        }
    }
}

