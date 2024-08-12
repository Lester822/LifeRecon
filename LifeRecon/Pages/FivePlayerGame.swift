//
//  LifeTrackerView.swift
//  LifeRecon
//
//  Created by Michael Stang on 4/9/24.
//

import SwiftUI

struct FivePlayerGame: View {
    @ObservedObject var current_game: ActiveGame
    var body: some View {
        ZStack (content: {
            Rectangle()
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                .foregroundColor(.black)
            VStack (alignment: .center, spacing: 0.0, content: {
                HStack (spacing: 0.0, content: {
                    let life1 = LifeBlock(player: current_game.players[0], game: current_game)
                    let life2 = LifeBlock(player: current_game.players[1], game: current_game)
                        .rotationEffect(Angle(degrees: 180))
                    life1
                        //.edgesIgnoringSafeArea(.all)
                    life2
                       // .edgesIgnoringSafeArea(.all)
                })
                .frame(height: UIScreen.main.bounds.height/3)
       
                HStack (spacing: 0.0, content: {
                    let life3 = LifeBlock(player: current_game.players[2], game: current_game)
                    let life4 = LifeBlock(player: current_game.players[3], game: current_game)
                        .rotationEffect(Angle(degrees: 180))
                    life3
                        //.edgesIgnoringSafeArea(.all)
                    life4
                        //.edgesIgnoringSafeArea(.all)
                    
                    
                })
                .frame(height: UIScreen.main.bounds.height/3)
                let life5 = LifeBlock(player: current_game.players[4], game: current_game)
                    .rotationEffect(Angle(degrees: 270))
                life5
                    .frame(width: UIScreen.main.bounds.height/3, height: UIScreen.main.bounds.width)
                    .padding(0.0)
                    .border(Color.red, width: 1)
                    //.edgesIgnoringSafeArea(.all)
            })
        })

            .padding(-10)
            
    }
}

#Preview {
    FivePlayerGame(current_game: ActiveGame(player_count: 4, starting_life: 40))
}
