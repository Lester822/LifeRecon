//
//  PlayMenuSwitcher.swift
//  LifeRecon
//
//  Created by Michael Stang on 10/4/24.
//

import SwiftUI

struct PlayMenuSwitcher: View {
    @ObservedObject var current_game: ActiveGame
    var body: some View {
        if current_game.caller.rotation == 90 || current_game.caller.rotation == -90 {
            PlayerMenu(current_game: current_game)
        } else {
            PlayerMenuVert(current_game: current_game)
        }
    }
}

#Preview {
    PlayMenuSwitcher(current_game: ActiveGame(player_count: 4, starting_life: 40))
}
