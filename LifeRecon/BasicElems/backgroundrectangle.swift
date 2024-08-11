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
            .foregroundColor(.black)
            //.frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
            .opacity(0.5)
            .ignoresSafeArea(.all)
            .onTapGesture {
                withAnimation {
                    current_game.showing_keypad = false
                    current_game.showing_circle_menu = false
                    current_game.showing_confirm = false
                    current_game.showing_player_menu = false
                    current_game.showing_commander_damage = false
                    current_game.blur_background = false
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
