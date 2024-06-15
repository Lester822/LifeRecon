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
    @Published var in_progress: Bool
    
    @Published var starting_life: Int
    
    @Published var current_page: String
    @Published var is_loading: Bool
    @Published var current_setting: String
    @Published var current_rotation: Double
    @Published var last_confirm: Bool
    
    @Published var first_confirm_line: String
    @Published var confirm_message: String
    @Published var confirm_action: String
    
    @Published var caller: Player
    
    @Published var showing_circle_menu: Bool
    @Published var showing_confirm: Bool
    @Published var showing_keypad: Bool
    @Published var showing_player_menu: Bool
    
    init(player_count: Int, starting_life: Int) {
        self.player_count = player_count
        self.current_page = "home"
        self.last_confirm = false
        self.showing_confirm = false
        self.showing_player_menu = false
        self.confirm_message = ""
        self.confirm_action = "reset"
        self.showing_keypad = false
        self.in_progress = false
        self.current_rotation = 0
        self.showing_circle_menu = false
        self.players = [Player(life_total: 0, name: "PLAYER 1"), Player(life_total: 0, name: "PLAYER 2"), Player(life_total: 0, name: "PLAYER 3"), Player(life_total: 0, name: "PLAYER 4"), Player(life_total: 0, name: "PLAYER 5")]
        self.is_loading = false
        self.current_setting = "player_count"
        self.caller = Player(life_total: 1, name: "PLAYER ERROR")
        self.starting_life = starting_life
        self.first_confirm_line = "Are you sure you want to"
    }
    
    func new_player_count(new_number: Int) {
        self.player_count = new_number
        self.players = []
        for i in 1...player_count {
            self.players.append(Player(life_total: self.starting_life, name: "PLAYER 1"))
            
        }
    }
}
