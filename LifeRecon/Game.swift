//
//  Game.swift
//  LifeRecon
//
//  Created by Michael Stang on 4/9/24.
//

import Foundation
import Dispatch

class ActiveGame: ObservableObject {
    @Published var players: [Player]
    @Published var player_count: Int
    @Published var showing_keypad: Bool
    @Published var caller: Player
    @Published var starting_life: Int
    @Published var showing_circle_menu: Bool
    @Published var current_page: String
    @Published var is_loading: Bool
    
    init(player_count: Int, starting_life: Int) {
        self.player_count = player_count
        self.current_page = "home"
        self.showing_keypad = false
        self.showing_circle_menu = false
        self.players = []
        self.is_loading = false
        self.caller = Player(life_total: 1)
        self.starting_life = starting_life
        for _ in 1...self.player_count {
            self.players.append(Player(life_total: starting_life))
        }
    }
    func new_player_count(new_number: Int) {
        self.player_count = new_number
        self.players = []
        for _ in 1...player_count {
            self.players.append(Player(life_total: self.starting_life))
        }
    }
}
