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
        Rectangle()
            .foregroundColor(.black)
            //.frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
            .opacity(0.5)
            .ignoresSafeArea(.all)
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
