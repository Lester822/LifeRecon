//
//  LifeTrackerView.swift
//  LifeRecon
//
//  Created by Michael Stang on 4/9/24.
//

import SwiftUI

struct LifeTrackerView: View {
    @ObservedObject var current_game: ActiveGame
    var body: some View {
            VStack (alignment: .center, spacing: 0.0, content: {
                HStack (spacing: 0.0, content: {
                    let life1 = LifeBlock(block_color: .blue, player: current_game.players[0])
                    let life2 = LifeBlock(block_color: .red, player: current_game.players[1])
                        .rotationEffect(Angle(degrees: 180))
                    life1
                    life2
                })
       
                HStack (spacing: 0.0, content: {
                    let life3 = LifeBlock(block_color: .green, player: current_game.players[2])
                    let life4 = LifeBlock(block_color: .yellow, player: current_game.players[3])
                        .rotationEffect(Angle(degrees: 180))
                    life3
                    life4
                    
                })
            })
            .padding(-10)
            
    }
}

#Preview {
    LifeTrackerView(current_game: ActiveGame(player_count: 4))
}
