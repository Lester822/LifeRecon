//
//  ContentView.swift
//  LifeRecon
//
//  Created by Recon Dev on 4/9/24.
//

import SwiftUI


struct ContentView: View {
    @State var current_view = "home"
    @State var button_text = "Start"
    var body: some View {
        VStack {
            if current_view == "home" {
                Loading()
            }
            if current_view == "life" {
                LifeTrackerView()
            }
        }
        
        Button(button_text) {
            if current_view == "life" {
                current_view = "home"
                button_text = "Start"
            } else if current_view == "home" {
                current_view = "life"
                button_text = "Go Home"
                
            }
        }
        .padding()
        }
    }
#Preview {
    ContentView()
}
