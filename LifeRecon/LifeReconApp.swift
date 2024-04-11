//
//  LifeReconApp.swift
//  LifeRecon
//
//  Created by Recon Dev on 4/9/24.
//

import SwiftUI

@main
struct LifeReconApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(current_game: ActiveGame(player_count: 4))
        }
    }
}
