//
//  ContentView.swift
//  LifeRecon
//
//  Created by Recon Dev on 4/9/24.
//

import SwiftUI
import UIKit

struct ContentView: View {
    @ObservedObject var current_game: ActiveGame
    
    var body: some View {
        VStack {
            if current_game.current_page == "home" {
                Loading(current_game: current_game)
                    .transition(.zoomIt)
            }
                if current_game.current_page != "home" && current_game.is_loading == false {
                    ZStack (content: {
                        if current_game.current_page == "four_player" {
                            FourPlayerGame(current_game: current_game)
                        } else if current_game.current_page == "three_player" {
                            ThreePlayerGame(current_game: current_game)
                        } else if current_game.current_page == "two_player" {
                            TwoPlayerGame(current_game: current_game)
                        }
                        if self.current_game.showing_circle_menu == true {
                            BackgroundRectangle(current_game: current_game)
                                .transition(.fade)
                            CircleMenu(current_game: current_game)
                                .transition(.zoomIt)
                        }
                        Button {
                            withAnimation {
                                //if current_game.showing_circle_menu == true {
                                    //current_game.showing_circle_menu = false
                                    //current_game.current_page = "home"
                                //} else {
                                let generator = UIImpactFeedbackGenerator(style: .light)
                                generator.prepare()
                                current_game.showing_circle_menu.toggle()
                                generator.impactOccurred()
                                //}
                            }
                        } label: {
                            Image("MenuIcon")
                                .resizable(resizingMode: .stretch)
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 100.0, height: 100.0)
                                .foregroundStyle(.tint)
                        }
                        if self.current_game.showing_keypad == true {
                            BackgroundRectangle(current_game: current_game)
                                .transition(.fade)
                            SetLifeKeypad(current_text: "", current_game: self.current_game)
                                .transition(.zoomIt)
                        }
                    })
                    
                }
            }
            
            
        }
    }

#Preview {
    ContentView(current_game: ActiveGame(player_count: 4, starting_life: 40))
}
