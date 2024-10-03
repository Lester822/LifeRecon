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
            .aspectRatio(contentMode: .fit)
            .scaleEffect(1.5)
            .brightness(-0.5)
            .foregroundColor(.black)
            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
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
