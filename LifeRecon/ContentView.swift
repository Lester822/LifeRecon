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
                ZStack {
                    Loading(current_game: current_game)
                        .transition(.zoomIt)
                    if self.current_game.showing_confirm == true {
                        BackgroundRectangle(current_game: current_game)
                            .transition(.fade)
                            .edgesIgnoringSafeArea(.all)
                        Confirmation(current_game: current_game, confirm_text: current_game.confirm_message)
                            .transition(.zoomIt)
                    }
                }
                
            } else if current_game.current_page == "settings" {
                ZStack {
                    StartGameSettings(current_game: current_game)
                        .transition(.zoomIt)
                }
                
            } else if current_game.is_loading == false {
                    ZStack (content: {
                        if current_game.current_page == "four_player" {
                            FourPlayerGame(current_game: current_game)
                                .background(.black)
                        } else if current_game.current_page == "three_player" {
                            ThreePlayerGame(current_game: current_game)
                                .background(.black)
                        } else if current_game.current_page == "two_player" {
                            TwoPlayerGame(current_game: current_game)
                                .background(.black)
                        } else if current_game.current_page == "one_player" {
                            OnePlayerGame(current_game: current_game)
                                .background(.black)
                        } else if current_game.current_page == "five_player" {
                            FivePlayerGame(current_game: current_game)
                                .background(.black)
                        }
                        if self.current_game.showing_circle_menu == true {
                            BackgroundRectangle(current_game: current_game)
                                .transition(.fade)
                            
                            VStack {
                                if current_game.current_page == "one_player" {
                                    Spacer()
                                        .frame(height: 500.0)
                                    CircleMenu(current_game: current_game)
                                        .transition(.zoomEffect)
                                        .zIndex(1)
                                } else {
                                    CircleMenu(current_game: current_game)
                                        .transition(.zoomEffect)
                                        .zIndex(1)
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
                            SetLifeKeypad(current_game: self.current_game)
                                .transition(.zoomEffect)
                                .rotationEffect(Angle(degrees: current_game.current_rotation))
                        }
                        if self.current_game.showing_confirm == true {
                            BackgroundRectangle(current_game: current_game)
                                .transition(.fade)
                                .edgesIgnoringSafeArea(.all)
                            Confirmation(current_game: current_game, confirm_text: current_game.confirm_message)
                                .transition(.zoomIt)
                        }
                        if self.current_game.showing_player_menu == true {
                            BackgroundRectangle(current_game: current_game)
                                .transition(.fade)
                            PlayerMenu(current_game: current_game)
                                .transition(.zoomIt)
                                .rotationEffect(Angle(degrees: current_game.caller.rotation))
                                .edgesIgnoringSafeArea(.all)
                                .frame(width: 10, height:10)
                                
                        }
                    })
                    
                }
            }
            
            
        }
    }

#Preview {
    ContentView(current_game: ActiveGame(player_count: 4, starting_life: 40))
}
