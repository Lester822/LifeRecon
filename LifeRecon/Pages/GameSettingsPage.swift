//
//  AppSettingsPage.swift
//  LifeRecon
//
//  Created by Michael Stang on 12/31/24.
//

import SwiftUI

struct GameSettingsPage: View {
    @ObservedObject var current_game: ActiveGame
    @ObservedObject var current_player: Player
    @Binding var showing_game_settings: Bool
    var onCommit: () -> Void
    
    
    func cleanup() {
        return
    }
    
    var body: some View {
        
        VStack {
            Text("Game Settings")
                .font(.largeTitle)
                .fontWeight(.heavy)
            
            Spacer()
                .frame(height: UIScreen.main.bounds.height * 0.05)
            
//            Text("Player Name")
//                .fontWeight(.heavy)
            
            HStack { // Commander Features
                Text("Commander Features")
                    .multilineTextAlignment(.trailing)
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding(.leading, 10.0)
                Spacer()
                    .frame(width: 20.0)
                Toggle_DualToggle(text_for_true: "On", text_for_false: "Off", toggle: $current_game.commander_features_enabled, current_game: current_game, player: current_player)
                    .frame(width: UIScreen.main.bounds.width * 0.5, height: UIScreen.main.bounds.height * 0.05)
                
            } // Commander Features

        }
        .padding()
    }
}

