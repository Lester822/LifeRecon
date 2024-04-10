//
//  Game.swift
//  LifeRecon
//
//  Created by Michael Stang on 4/9/24.
//

import Foundation

class ActiveGame: ObservableObject {
    @Published var players: [Player]
    var player_count: Int
    
    init(player_count: Int) {
        self.player_count = player_count
        self.players = []
        for i in 1...player_count {
            self.players.append(Player(life_total: 40))
        }
    }
}
