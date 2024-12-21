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
                DiceTray(current_game: current_game, middle_gap: false)
                GameResetBar(current_game: current_game, middle_gap: false)
                MenuBar(current_game: current_game, middle_gap: false)
                Spacer()
                    .frame(height: UIScreen.main.bounds.height * 0.05)
            })
        })
        .padding(-10)
    }
}

#Preview {
    OnePlayerGame(current_game: ActiveGame(player_count: 3, starting_life: 40))
}
