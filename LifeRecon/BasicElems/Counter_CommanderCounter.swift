//
//  LifeBlock.swift
//  LifeRecon
//
//  Created by Michael Stang on 4/9/24.
//

import SwiftUI
import UIKit

struct Counter_CommanderCounter: View {
    @ObservedObject var player: Player
    @ObservedObject var current_game: ActiveGame
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Button {
                    soft_haptic_pulse()
                    withAnimation {
                        player.commander_count = player.commander_count == 1 ? 2 : 1
                    }
                } label: {
                    if player.commander_count == 1 {
                        Image("OneCommanderIcon")
                            .resizable(resizingMode: .stretch)
                            .aspectRatio(contentMode: .fit)
                            .padding(.all, 0.0)
                            .frame(width: geometry.size.width/1.8)
                            .transition(.zoomEffect)
                    } else {
                        Image("TwoCommanderIcon")
                            .resizable(resizingMode: .stretch)
                            .aspectRatio(contentMode: .fit)
                            .padding(.all, 0.0)
                            .frame(width: geometry.size.width/1.8)
                            .transition(.zoomEffect)
                    }
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
        }
        .aspectRatio(1, contentMode: .fit) // Maintain aspect ratio
    }
}

#Preview {
    Counter_CommanderCounter(player: Player(life_total: 30, name: "PLAYER 1"), current_game: ActiveGame(player_count: 4, starting_life: 40))
}
