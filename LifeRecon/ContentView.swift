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
    @ObservedObject var current_game = ActiveGame(player_count: 4)
    @State var game_started = false

    var body: some View {
        VStack {
            if current_view == "home" {
                Loading()
                Button(button_text) {
                    if current_view == "life" {
                        current_view = "home"
                        button_text = "Start"
                    } else if current_view == "home" {
                        if game_started == false {
                            game_started = true
                        }
                        current_view = "life"
                        button_text = "Go Home"
                        
                    }
                }
                .padding()
                .buttonStyle(.borderedProminent)
            }
            if current_view == "life" {
                ZStack (content: {
                    LifeTrackerView(current_game: current_game)
                    Button {
                        current_view = "home"
                    } label: {
                        Image("MenuIcon")
                            .resizable(resizingMode: .stretch)
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 100.0, height: 100.0)
                            .foregroundStyle(.tint)
                            .rotationEffect(Angle(degrees: 90))
                    }
                    if self.current_game.showing_keypad == true {
                        SetLifeKeypad(current_text: "", current_game: self.current_game)
                            //.background(Color.black.opacity(0.4))
                    }
                })
                
            }
        }
        

        }
    }
#Preview {
    ContentView()
}
