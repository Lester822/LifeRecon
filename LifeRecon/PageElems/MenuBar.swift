//
//  MenuBar.swift
//  LifeRecon
//
//  Created by Michael Stang on 10/4/24.
//

import SwiftUI

struct MenuBar: View {
    @ObservedObject var current_game: ActiveGame
    let middle_gap: Bool
    
    var body: some View {
        if (current_game.showing_circle_menu || current_game.player_count == 1) {
            HStack {
                Button {
                    soft_haptic_pulse()
                    print("test")
                } label: {
                    Image("Settings")
                        .resizable(resizingMode: .stretch)
                        .frame(width: 50.0, height: 50.0)
                }
                Button {
                    soft_haptic_pulse()
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

                if middle_gap {
                    Spacer()
                        .frame(width: 125.0)
                }
                
                Button {
                    soft_haptic_pulse()
                    withAnimation {
                        current_game.showing_circle_menu = false
                        current_game.showing_confirm = false
                        current_game.showing_dice_tray.toggle()
                    }
                } label: {
                    Image("Dice")
                        .resizable(resizingMode: .stretch)
                        .frame(width: 50.0, height: 50.0)
                }
                Button {
                    withAnimation {
                        soft_haptic_pulse()
                        current_game.showing_circle_menu = false
                        current_game.showing_dice_tray = false
                        current_game.showing_confirm.toggle()
//                        current_game.first_confirm_line = "Are you sure you want to"
//                        current_game.confirm_message = "reset the game?"
//                        current_game.blur_background = true
//                        current_game.showing_confirm =  true
//                        current_game.confirm_action = "reset"
                    }
                } label: {
                    Image("Restart")
                        .resizable(resizingMode: .stretch)
                        .frame(width: 50.0, height: 50.0)
                }
            }
        }
    }
}

#Preview {
    MenuBar(current_game: ActiveGame(player_count: 4, starting_life: 40), middle_gap: true)
}
