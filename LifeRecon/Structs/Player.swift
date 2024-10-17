//
//  Player.swift
//  LifeRecon
//
//  Created by Michael Stang on 4/9/24.
//

import Foundation
import SwiftUI

class Player: ObservableObject {
    @Published var life_total: Int
    @Published var starting_life: Int
    @Published var player_number: Int
    @Published var rotation: Double
    @Published var white_mana: Int
    @Published var blue_mana: Int
    @Published var black_mana: Int
    @Published var red_mana: Int
    @Published var green_mana: Int
    @Published var name: String
    @Published var colorless_mana: Int
    @Published var commander_damage: Array<Array<Int>> // So it would look like [[1], [2], [1,2]] The list represents multiple commanders
    @Published var commander_count: Int
    
    @Published var storm_count: Int
    @Published var poison_counters: Int
    @Published var rad_counters: Int
    @Published var experience_counters: Int
    @Published var energy_counters: Int
    @Published var ticket_counters: Int
    @Published var acorn_counters: Int
    
    @Published var commander_tax_1: Int
    @Published var commander_tax_2: Int
    
    @Published var active_counters: Array<String>
    
    @Published var reset_floating_each_time: Bool = false
    @Published var is_monarch: Bool = false
    @Published var has_initiative: Bool = false
    @Published var has_cities_blessing: Bool = false
    
    @Published var current_dungeon: String = ""
    @Published var dungeon_position: String = ""
    @Published var completed_dungeons: Set<String> = []
    
    @Published var background_color: Color = .red
    @Published var background_image: String = "NONE"
    
    init(life_total: Int, name: String) {
        self.life_total = life_total
        self.starting_life = life_total
        self.name = name
        self.rotation = 90.0
        self.white_mana = 0
        self.blue_mana = 0
        self.black_mana = 0
        self.red_mana = 0
        self.green_mana = 0
        self.colorless_mana = 0
        self.commander_damage = [[0,0], [0,0], [0,0], [0,0]]
        self.player_number = 0
        self.commander_count = 1
        
        self.storm_count = 0
        self.poison_counters = 0
        self.rad_counters = 0
        self.experience_counters = 0
        self.energy_counters = 0
        self.ticket_counters = 0
        self.acorn_counters = 0
        
        self.commander_tax_1 = 0
        self.commander_tax_2 = 0
        
        self.active_counters = []
        
    }
}
