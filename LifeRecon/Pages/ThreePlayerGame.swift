//
//  LifeTrackerView.swift
//  LifeRecon
//
//  Created by Michael Stang on 4/9/24.
//

import SwiftUI

struct ThreePlayerGame: View {
    @ObservedObject var current_game: ActiveGame
    var body: some View {
        ZStack (content: {
            Rectangle()
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                .foregroundColor(.black)
            VStack (alignment: .center, spacing: 0.0, content: {
                HStack (spacing: 0.0, content: {
                    let life1 = LifeBlock(block_color: .blue, player: current_game.players[0], game: current_game)
                    let life2 = LifeBlock(block_color: .red, player: current_game.players[1], game: current_game)
                        .rotationEffect(Angle(degrees: 180))
                    life1
                        .edgesIgnoringSafeArea(.all)
                    life2
                        .edgesIgnoringSafeArea(.all)
                })
       
                HStack (spacing: 0.0, content: {
                    let life3 = LifeBlock(block_color: .green, player: current_game.players[2], game: current_game)
                        .rotationEffect(Angle(degrees: 270))
                    life3
                        .edgesIgnoringSafeArea(.all)
                    
                })
            })
        })
            .padding(-10)
            
    }
}

#Preview {
    ThreePlayerGame(current_game: ActiveGame(player_count: 3, starting_life: 40))
}
