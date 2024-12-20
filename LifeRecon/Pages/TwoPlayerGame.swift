//
//  LifeTrackerView.swift
//  LifeRecon
//
//  Created by Michael Stang on 4/9/24.
//

import SwiftUI

struct TwoPlayerGame: View {
    @ObservedObject var current_game: ActiveGame
    var body: some View {
        ZStack (content: {
            Rectangle()
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                .foregroundColor(.black)
            VStack (alignment: .center, spacing: 0.0, content: {
                HStack (spacing: 0.0, content: {
                    let life1 = LifeBlockA(player: current_game.players[0], game: current_game)
                        //.rotationEffect(Angle(degrees: 90))
                    life1
                        .edgesIgnoringSafeArea(.all)
                })
                
                MenuBar(current_game: current_game, middle_gap: true)
                DiceTray(current_game: current_game, middle_gap: true)
                GameResetBar(current_game: current_game, middle_gap: true)

       
                HStack (spacing: 0.0, content: {
                    let life3 = LifeBlockA(player: current_game.players[1], game: current_game)
                        //.rotationEffect(Angle(degrees: 270))
                    life3
                        .edgesIgnoringSafeArea(.all)
                    
                })
            })
        })

            .padding(-10)
            
    }
}

#Preview {
    TwoPlayerGame(current_game: ActiveGame(player_count: 3, starting_life: 40))
}
