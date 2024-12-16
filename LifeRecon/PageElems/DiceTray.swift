//
//  DiceTray.swift
//  LifeRecon
//
//  Created by Michael Stang on 11/19/24.
//

import SwiftUI

struct DiceTray: View {
    @ObservedObject var current_game: ActiveGame
    let middle_gap: Bool
    
    var body: some View {
        if current_game.showing_dice_tray {
            VStack {
                HStack { // Top Row of Dice
                    DiceElement(icon: "Dice_D2", min_value: 1, max_value: 2, mode: 1, current_game: current_game)
                        .frame(width: 50.0, height: 50.0)
                    DiceElement(icon: "Dice_D4", min_value: 1, max_value: 4, mode: 0, current_game: current_game)
                        .frame(width: 50.0, height: 50.0)
                    if middle_gap {
                        Spacer()
                            .frame(width: 125.0)
                    }
                    DiceElement(icon: "Dice_D6", min_value: 1, max_value: 6, mode: 0, current_game: current_game)
                        .frame(width: 50.0, height: 50.0)
                    DiceElement(icon: "Dice_D8", min_value: 1, max_value: 8, mode: 0, current_game: current_game)
                        .frame(width: 50.0, height: 50.0)
                }
                HStack { // Bottom Row of Dice
                    DiceElement(icon: "Dice_D10", min_value: 1, max_value: 10, mode: 0, current_game: current_game)
                        .frame(width: 50.0, height: 50.0)
                    DiceElement(icon: "Dice_D12", min_value: 1, max_value: 12, mode: 0, current_game: current_game)
                        .frame(width: 50.0, height: 50.0)
                    if middle_gap {
                        Spacer()
                            .frame(width: 125.0)
                    }
                    DiceElement(icon: "Dice_D20", min_value: 1, max_value: 20, mode: 0, current_game: current_game)
                        .frame(width: 50.0, height: 50.0)
                    DiceElement(icon: "Dice_DChoose", min_value: 1, max_value: 2, mode: 2, current_game: current_game)
                        .frame(width: 50.0, height: 50.0)
                }
            }
        }
    }
}

#Preview {
    DiceTray(current_game: ActiveGame(player_count: 4, starting_life: 40), middle_gap: true)
}
