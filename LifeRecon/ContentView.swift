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
            } else if current_game.current_page == "settings" {
                StartGameSettings(current_game: current_game)
                    .transition(.zoomIt)
            } else if current_game.is_loading == false {
                    ZStack (content: {
                        if current_game.current_page == "four_player" {
                            FourPlayerGame(current_game: current_game)
                        } else if current_game.current_page == "three_player" {
                            ThreePlayerGame(current_game: current_game)
                        } else if current_game.current_page == "two_player" {
                            TwoPlayerGame(current_game: current_game)
                        } else if current_game.current_page == "one_player" {
                            OnePlayerGame(current_game: current_game)
                        }
                        if self.current_game.showing_circle_menu == true {
                            BackgroundRectangle(current_game: current_game)
                                .transition(.fade)
                            
                            VStack {
                                if current_game.current_page == "one_player" {
                                    Spacer()
                                        .frame(height: 500.0)
                                    CircleMenu(current_game: current_game)
                                        .transition(.zoomIt)
                                } else {
                                    CircleMenu(current_game: current_game)
                                        .transition(.zoomIt)
                                }
                                
                            }
                            
                        }
                        VStack {
                            if current_game.current_page == "one_player" {
                                Spacer()
                                    .frame(height: 500.0)
                            }
                            Button {
                                let generator = UIImpactFeedbackGenerator(style: .light)
                                generator.prepare()
                                withAnimation {
                                    current_game.showing_circle_menu.toggle()
                                }
                                generator.impactOccurred()
                            } label: {
                                Image("MenuIcon")
                                    .resizable(resizingMode: .stretch)
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 100.0, height: 100.0)
                                    .foregroundStyle(.tint)
                            }
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
