//
//  MenuBar.swift
//  LifeRecon
//
//  Created by Michael Stang on 10/4/24.
//

import SwiftUI

struct GameResetBar: View {
    @ObservedObject var current_game: ActiveGame
    let middle_gap: Bool
    
    var body: some View {
        if (current_game.showing_confirm) {
            HStack {
                VStack {
                    Spacer()
                        .frame(height: 5.0)
                    Button {
                        withAnimation {
                            current_game.showing_confirm = false
                            current_game.showing_circle_menu = false
                            reset_game()
                        }
                    } label: {
                        Key_Large(given_text: "Reset", color: .black, background: .red)
                    }
                    .transition(.zoomEffect)
                    Spacer()
                        .frame(height: 5.0)
                }
                

                if middle_gap {
                    Spacer()
                        .frame(width: 125.0)
                }
                
                Button {
                    withAnimation {
                        current_game.last_confirm = false
                        current_game.showing_confirm = false
                        current_game.blur_background = false
                        current_game.showing_circle_menu = true
                    }
                } label: {
                    Key_Large(given_text: "Cancel", color: .black, background: .white)
                }
                .transition(.zoomEffect)
            }
        }
    }
    
    func reset_game() {
        withAnimation {
            current_game.day_night = ""
            current_game.showing_commander_damage = false
            current_game.blur_background = false
            for player in current_game.players {
                player.life_total = current_game.starting_life
                player.white_mana = 0
                player.blue_mana = 0
                player.black_mana = 0
                player.red_mana = 0
                player.green_mana = 0
                player.commander_damage = [[0,0],[0,0],[0,0],[0,0],[0,0]]
                player.commander_count = 1
                
                player.storm_count = 0
                player.poison_counters = 0
                player.rad_counters = 0
                player.experience_counters = 0
                player.energy_counters = 0
                player.ticket_counters = 0
                player.acorn_counters = 0
                
                player.is_monarch = false
                player.has_initiative = false
                player.has_cities_blessing = false
                
                player.current_dungeon = ""
                player.dungeon_position = ""
                player.completed_dungeons = []
                player.ring_stage = 0
                
                player.commander_tax_1 = 0
                player.commander_tax_2 = 0
                for _ in current_game.players {
                    player.commander_damage.append([0])
                }
                
            }
        }
    }
}

#Preview {
    MenuBar(current_game: ActiveGame(player_count: 4, starting_life: 40), middle_gap: true)
}
