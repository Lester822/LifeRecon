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
    @Published var showing_keypad: Bool
    @Published var caller: Player
    
    init(player_count: Int) {
        self.player_count = player_count
        self.showing_keypad = false
        self.players = []
        self.caller = Player(life_total: 1)
        for i in 1...player_count {
            self.players.append(Player(life_total: 40))
        }
    }
}
