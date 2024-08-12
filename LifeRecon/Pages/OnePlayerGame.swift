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
                    let life1 = LifeBlock(player: current_game.players[0], game: current_game)
                        .rotationEffect(Angle(degrees: 270))
                    life1
                        .edgesIgnoringSafeArea(.all)
                })
                .frame(width: UIScreen.main.bounds.height, height: UIScreen.main.bounds.height)
            })
        })

            .padding(-10)
            
    }
}

#Preview {
    OnePlayerGame(current_game: ActiveGame(player_count: 3, starting_life: 40))
}
