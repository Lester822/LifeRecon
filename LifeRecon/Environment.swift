//
//  Environment.swift
//  LifeRecon
//
//  Created by Michael Stang on 4/10/24.
//

import Foundation

class Environment: ObservableObject {
    @Published var showing_keypad: Bool
    
    init(showing_keypad: Bool) {
        self.showing_keypad = showing_keypad
    }
}
