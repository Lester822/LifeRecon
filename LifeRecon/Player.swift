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
    
    init(life_total: Int) {
        self.life_total = life_total
        self.starting_life = life_total
    }
}

