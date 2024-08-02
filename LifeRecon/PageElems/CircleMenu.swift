//
//  CircleMenu.swift
//  LifeRecon
//
//  Created by Michael Stang on 4/11/24.
//

import SwiftUI

struct CircleMenu: View {
    @ObservedObject var current_game: ActiveGame
    var body: some View {
        ZStack() {
            Circle()
                .frame(width: 200.0, height: 200.0)
                .opacity(0.5)
                .foregroundColor(.black)

            HStack() {
                Button {
                    withAnimation {
                        soft_pulse()
                        current_game.first_confirm_line = "Are you sure you want to"
                        current_game.confirm_message = "reset the game?"
                        current_game.showing_confirm =  true
                        current_game.confirm_action = "reset"
                    }
                } label: {
                    Image("Restart")
                        .resizable(resizingMode: .stretch)
                        .frame(width: 50.0, height: 50.0)
                }
                
                Spacer()
                    .frame(width: 20.0)
                
                VStack() {
                    Button {
                        soft_pulse()
                        print("test")
                    } label: {
                        Image("Dice")
                            .resizable(resizingMode: .stretch)
                            .frame(width: 50.0, height: 50.0)
                    }
                    Spacer()
                        .frame(width: 0, height: 90.0)
                    Button {
                        soft_pulse()
                        print("test")
                    } label: {
                        Image("Settings")
                            .resizable(resizingMode: .stretch)
                            .frame(width: 50.0, height: 50.0)
                    }
                }
                Spacer()
                    .frame(width: 20.0)
                Button {
                    soft_pulse()
                    withAnimation {
                        current_game.showing_circle_menu = false
                        current_game.current_page = "home"
                    }
                } label: {
                    Image("Home")
                        .resizable(resizingMode: .stretch)
                        .frame(width: 50.0, height: 50.0)
                }
            }
        }

    }
        }

func soft_pulse() {
    let generator = UIImpactFeedbackGenerator(style: .soft)
    generator.prepare()
    generator.impactOccurred()
}

#Preview {
    CircleMenu(current_game: ActiveGame(player_count: 4, starting_life: 40))
}


