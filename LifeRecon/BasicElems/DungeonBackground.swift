//
//  DungeonBackground.swift
//  LifeRecon
//
//  Created by Michael Stang on 10/1/24.
//

import SwiftUI

struct DungeonBackground: View {
    @ObservedObject var current_game: ActiveGame
    
    var body: some View {
        Image("DungeonWall")
            .allowsHitTesting(current_game.showing_dungeon)
            .aspectRatio(contentMode: .fit)
            .rotationEffect(current_game.caller.rotation == 0 || current_game.caller.rotation == 180 ? Angle(degrees: 90) : Angle(degrees: 0))
            .brightness(-0.5)
            .foregroundColor(.black)
            .frame(width: UIScreen.main.bounds.width-1, height: UIScreen.main.bounds.height-1)
            .blur(radius: 5.0)
            .ignoresSafeArea(.all)
            .rotationEffect(Angle(degrees: 90))
            .onTapGesture {
                withAnimation {
                    current_game.showing_dungeon = false
                }
            }
    }
}

#Preview {
    DungeonBackground(current_game: ActiveGame(player_count: 4, starting_life: 40))
}
