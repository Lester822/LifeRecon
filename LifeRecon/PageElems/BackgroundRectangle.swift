//
//  backgroundrectangle.swift
//  LifeRecon
//
//  Created by Michael Stang on 4/11/24.
//

import SwiftUI

let ROTATE_SNAP = true

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
                    current_game.temporary_rotate_applied = false
                    current_game.temporary_rotate = 0.0
                    current_game.showing_keypad = false
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
            .gesture(
                DragGesture().onEnded { gesture in
                        
                    let horizontalMovement = gesture.translation.width
                    let verticalMovement = gesture.translation.height
                    
                    let angleInRadians = atan2(verticalMovement, horizontalMovement)
                    var angleInDegrees = angleInRadians * 180 / .pi  // convert to degrees
                    
                    if ROTATE_SNAP == true {
                        // 1) Snap angleInDegrees to nearest multiple of 90
                        // Use “toNearestOrAwayFromZero” if you want the conventional "round halves up" style:
                        angleInDegrees = (angleInDegrees / 90.0).rounded(.toNearestOrAwayFromZero) * 90.0

                        // 2) Wrap to [-180, 180]
                        if angleInDegrees - current_game.temporary_rotate > 180 {
                            angleInDegrees -= 360
                        } else if angleInDegrees - current_game.temporary_rotate < -180 {
                            angleInDegrees += 360
                        }
                    }
                    
                    withAnimation {
                        current_game.temporary_rotate_applied = true
                        current_game.temporary_rotate = angleInDegrees
                    }
                }
            )
    }
}

#Preview {
    BackgroundRectangle(current_game: ActiveGame(player_count: 4, starting_life: 40))
}
