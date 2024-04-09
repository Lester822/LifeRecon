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
    @State var current_game: ActiveGame
    var body: some View {
        VStack {
            if current_view == "home" {
                Loading()
            }
            if current_view == "life" {
                LifeTrackerView(current_game: current_game)
            }
        }
        
        Button(button_text) {
            if current_view == "life" {
                current_view = "home"
                button_text = "Start"
            } else if current_view == "home" {
                current_game = ActiveGame(player_count: 4)
                current_view = "life"
                button_text = "Go Home"
                
                
            }
        }
        .padding()
        .buttonStyle(.borderedProminent)
        }
    }
#Preview {
    ContentView(current_game: ActiveGame(player_count: 1))
}
