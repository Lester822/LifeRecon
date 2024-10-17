//
//  DungeonDelverSwitcher.swift
//  LifeRecon
//
//  Created by Michael Stang on 10/14/24.
//

import SwiftUI

struct DungeonDelverSwitcher: View {
    @ObservedObject var current_game: ActiveGame
    @ObservedObject var caller: Player
    
    var body: some View {
        if current_game.caller.rotation == 90 || current_game.caller.rotation == -90 {
            DungeonDelver(current_game: current_game, caller: caller)
        } else {
            DungeonDelverVert(current_game: current_game, caller: caller)
        }
    }
}

#Preview {
    DungeonDelverSwitcher(current_game: ActiveGame(player_count: 4, starting_life: 4), caller: Player(life_total: 4, name: "Player 1"))
}
