//
//  MenuButton.swift
//  LifeRecon
//
//  Created by Michael Stang on 8/10/24.
//

import SwiftUI


struct CommanderToggleButton: View {
    @ObservedObject var current_game: ActiveGame
    @ObservedObject var player: Player
    
    var body: some View {
        ZStack {
            Image("LifeLossCommanderDamageButton_Base")
                .resizable(resizingMode: .stretch)
                .aspectRatio(contentMode: .fit)
                .frame(width: 100.0, height: 100.0)
                .foregroundStyle(.tint)
                .rotationEffect(Angle(degrees: player.rotation))
            Button {
                withAnimation {
                    current_game.caller.subtract_life_with_cmdr_damage.toggle()
    //                current_game.blur_background.toggle()
                }
                medium_haptic_pulse()
                
            } label: {
                Image(player.subtract_life_with_cmdr_damage ? "LifeLossCommanderDamageButton_On" : "LifeLossCommanderDamageButton")
                    .resizable(resizingMode: .stretch)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100.0, height: 100.0)
                    .foregroundStyle(.tint)
                    .rotationEffect(Angle(degrees: player.rotation))
                    
            }
        }
        
        
    }
}

#Preview {
    CommanderToggleButton(current_game: ActiveGame(player_count: 40, starting_life: 4), player: Player(life_total: 40, name: "Name"))
}
