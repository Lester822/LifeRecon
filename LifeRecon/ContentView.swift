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
    @ObservedObject var current_game: ActiveGame
    @State var game_started = false

    var body: some View {
        VStack {
            if current_view == "home" {
                Loading()
                
                HStack (content: {
                    Button {
                        withAnimation(.easeInOut(duration: 0.2)) {
                            current_view = "four_player"
                            if current_game.player_count != 4 {
                                current_game.new_player_count(new_number: 4)
                                current_game.starting_life = 40
                            }
                        }
                    } label: {
                        SquareButton(button_color: .gray, text_color: .white, title: "4 Players", icon: "FourPlayer")
                    }
                    Button {
                        withAnimation(.easeInOut(duration: 0.2)) {
                            current_view = "three_player"
                            if current_game.player_count != 3 {
                                current_game.new_player_count(new_number: 3)
                                current_game.starting_life = 40
                            }
                        }
                    } label: {
                        SquareButton(button_color: .gray, text_color: .white, title: "3 Players", icon: "ThreePlayer")
                    }
                    Button {
                        withAnimation(.easeInOut(duration: 0.2)) {
                            current_view = "two_player"
                            if current_game.player_count != 2 {
                                current_game.new_player_count(new_number: 2)
                                current_game.starting_life = 40
                            }
                        }
                    } label: {
                        SquareButton(button_color: .gray, text_color: .white, title: "2 Players", icon: "TwoPlayer")
                    }
                })



            }
            if current_view != "home" {
                ZStack (content: {
                    if current_view == "four_player" {
                        FourPlayerGame(current_game: current_game)
                    } else if current_view == "three_player" {
                        ThreePlayerGame(current_game: current_game)
                    } else if current_view == "two_player" {
                        TwoPlayerGame(current_game: current_game)
                    }
                    Button {
                        withAnimation(.easeInOut(duration: 0.2)) {
                            current_view = "home"
                        }
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
                    }
                })
                
            }
        }
        

        }
    }
#Preview {
    ContentView(current_view:"home", current_game: ActiveGame(player_count: 4, starting_life: 40))
}
