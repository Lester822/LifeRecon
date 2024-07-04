//
//  Player.swift
//  LifeRecon
//
//  Created by Michael Stang on 4/9/24.
//

import Foundation

class Player: ObservableObject {
    @Published var life_total: Int
    @Published var starting_life: Int
    @Published var rotation: Double
    @Published var white_mana: Int
    @Published var blue_mana: Int
    @Published var black_mana: Int
    @Published var red_mana: Int
    @Published var green_mana: Int
    @Published var name: String
    @Published var colorless_mana: Int
    @Published var commander_damage: Array<Array<Int>> // So it would look like [[1], [2], [1,2]] The list represents multiple commanders
    
    init(life_total: Int, name: String) {
        self.life_total = life_total
        self.starting_life = life_total
        self.name = name
        self.rotation = 0.0
        self.white_mana = 0
        self.blue_mana = 0
        self.black_mana = 0
        self.red_mana = 0
        self.green_mana = 0
        self.colorless_mana = 0
        self.commander_damage = []
    }
}

