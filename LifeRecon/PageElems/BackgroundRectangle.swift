//
//  backgroundrectangle.swift
//  LifeRecon
//
//  Created by Michael Stang on 4/11/24.
//

import SwiftUI

struct BackgroundRectangle: View {
    @ObservedObject var current_game: ActiveGame
    var body: some View {
        Rectangle()
            .foregroundStyle(.black)
            //.frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
            .opacity(0.6)
            .ignoresSafeArea(.all)
            .onTapGesture {
                withAnimation {
                    current_game.showing_keypad = false
                    current_game.showing_confirm = false
                    current_game.showing_player_menu = false
                    current_game.showing_commander_damage = false
                    current_game.blur_background = false
                    current_game.showing_dungeon = false
                    current_game.showing_random_dice_menu = false
                }
                
                if current_game.caller.reset_floating_each_time == true {
                    current_game.caller.white_mana = 0
                    current_game.caller.blue_mana = 0
                    current_game.caller.black_mana = 0
                    current_game.caller.red_mana = 0
                    current_game.caller.green_mana = 0
                    current_game.caller.colorless_mana = 0
                }
                
                current_game.current_rotation = 0
                current_game.current_operation = "="
                current_game.keypad_current_text = ""
            }
    }
}

#Preview {
    BackgroundRectangle(current_game: ActiveGame(player_count: 4, starting_life: 40))
}
