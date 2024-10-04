//
//  LifeTrackerView.swift
//  LifeRecon
//
//  Created by Michael Stang on 4/9/24.
//

import SwiftUI

struct OnePlayerGame: View {
    @ObservedObject var current_game: ActiveGame
    var body: some View {
        ZStack (content: {
            Rectangle()
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                .foregroundColor(.black)
            VStack (alignment: .center, spacing: 0.0, content: {
                HStack (spacing: 0.0, content: {
                    let life1 = LifeBlockA(player: current_game.players[0], game: current_game)
                    life1
                })

                HStack {
                    Button {
                        soft_pulse()
                        withAnimation {
                            current_game.showing_circle_menu = false
                            current_game.blur_background = false
                            current_game.current_page = "home"
                        }
                    } label: {
                        Image("Home")
                            .resizable(resizingMode: .stretch)
                            .frame(width: 50.0, height: 50.0)
                    }
                    Button {
                        soft_pulse()
                        print("test")
                    } label: {
                        Image("Settings")
                            .resizable(resizingMode: .stretch)
                            .frame(width: 50.0, height: 50.0)
                    }
                    Button {
                        soft_pulse()
                        print("test")
                    } label: {
                        Image("Dice")
                            .resizable(resizingMode: .stretch)
                            .frame(width: 50.0, height: 50.0)
                    }
                    Button {
                        withAnimation {
                            soft_pulse()
                            current_game.showing_circle_menu = false
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
                }
                .padding(.bottom, 30.0)
            })
        })

            .padding(-10)
            
    }
}

#Preview {
    OnePlayerGame(current_game: ActiveGame(player_count: 3, starting_life: 40))
}
