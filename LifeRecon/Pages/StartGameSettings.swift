//
//  StartGameSettings.swift
//  LifeRecon
//
//  Created by Michael Stang on 4/18/24.
//

import SwiftUI

struct PlayerCount: View {
    @ObservedObject var current_game: ActiveGame
    
    var body: some View {
        VStack {
            Text("Player Count")
                .font(.largeTitle)
                .fontWeight(.heavy)
            Text("Choose the number of players")
            Spacer()
                .frame(height: 40.0)
            HStack {
                VStack {
                    
                    Button {
                        withAnimation(.easeInOut(duration: 0.2)) {
                            current_game.players[0].rotation = 0
                            let generator = UIImpactFeedbackGenerator(style: .medium)
                            generator.prepare()
                            generator.impactOccurred()
                            current_game.player_count = 1
                            withAnimation {
                                current_game.current_setting = "starting_life"
                            }
                        }
                        
                    } label: {
                        SquareButton(button_color: .black, text_color: .white, title: "1", icon: "NONE")
                    }
                    
                    
                    Button {
                        withAnimation(.easeInOut(duration: 0.2)) {
                            current_game.players[0].rotation = 90
                            current_game.players[1].rotation = -90
                            current_game.players[2].rotation = 0
                            let generator = UIImpactFeedbackGenerator(style: .medium)
                            generator.prepare()
                            generator.impactOccurred()
                            current_game.player_count = 3
                            withAnimation {
                                current_game.current_setting = "starting_life"
                            }
                           
                        }
                    } label: {
                        SquareButton(button_color: .black, text_color: .white, title: "3", icon: "NONE")
                        
                    }
                }
                
                VStack {
                    
                    Button {
                        withAnimation(.easeInOut(duration: 0.2)) {
                            current_game.players[0].rotation = 180
                            current_game.players[1].rotation = 0
                            let generator = UIImpactFeedbackGenerator(style: .medium)
                            generator.prepare()
                            generator.impactOccurred()
                            current_game.player_count = 2
                            withAnimation {
                                current_game.current_setting = "starting_life"
                            }
                        }
                    } label: {
                        SquareButton(button_color: .black, text_color: .white, title: "2", icon: "NONE")
                    }
                    
                    Button {
                        withAnimation(.easeInOut(duration: 0.2)) {
                            current_game.players[0].rotation = 90
                            current_game.players[1].rotation = -90
                            current_game.players[2].rotation = 90
                            current_game.players[3].rotation = -90
                            let generator = UIImpactFeedbackGenerator(style: .medium)
                            generator.prepare()
                            generator.impactOccurred()
                            current_game.player_count = 4
                            withAnimation {
                                current_game.current_setting = "starting_life"
                            }
                            
                        }
                    } label: {
                        SquareButton(button_color: .black, text_color: .white, title: "4", icon: "NONE")
                    }
                }
            }
        }
    }
}
    

struct StartingLife: View {
    @ObservedObject var current_game: ActiveGame
    
    var body: some View {
        VStack {
            Text("Starting Life")
                .font(.largeTitle)
                .fontWeight(.heavy)
            Text("Choose what life to start at")
            Spacer()
                .frame(height: 40.0)
            BasicKeypad(current_text: "40", current_game: current_game)
        }
    }
}


struct OptionalSettings: View {
    @ObservedObject var current_game: ActiveGame
    
    var body: some View {
        VStack {
            Text("Optional Settings")
                .font(.largeTitle)
                .fontWeight(.heavy)
            Text("Change various aspects of the game")
            Spacer()
                .frame(height: 40.0)
            Button {
                haptic_pulse()
                current_game.in_progress = true
                current_game.showing_circle_menu = false
                current_game.showing_commander_damage = false
                var index = 1
                for player in current_game.players {
                    player.life_total = current_game.starting_life
                    player.name = "PLAYER " + String(index)
                    player.player_number = index
                    index += 1
                    player.white_mana = 0
                    player.blue_mana = 0
                    player.black_mana = 0
                    player.red_mana = 0
                    player.green_mana = 0
                    player.commander_count = 1
                    player.commander_damage = []
                    player.storm_count = 0
                    player.poison_counters = 0
                    player.rad_counters = 0
                    player.experience_counters = 0
                    player.energy_counters = 0
                    player.ticket_counters = 0
                    player.acorn_counters = 0
                    for _ in current_game.players {
                        player.commander_damage.append([0])
                    }
                    
                }
                if current_game.player_count == 1 {
                    withAnimation{
                        current_game.current_page = "one_player"
                    }
                } else if current_game.player_count == 2 {
                    withAnimation{
                        current_game.current_page = "two_player"
                    }
                } else if current_game.player_count == 3 {
                    withAnimation{
                        current_game.current_page = "three_player"
                    }
                } else if current_game.player_count == 4 {
                    withAnimation{
                        current_game.current_page = "four_player"
                    }
                } else if current_game.player_count == 5 {
                    withAnimation{
                        current_game.current_page = "five_player"
                    }
                }
                
            } label: {
                LargeKey(given_text: "Start", color: .white, background: .red)
            }
        }
    }
}

struct StartGameSettings: View {
    @ObservedObject var current_game: ActiveGame
    
    var body: some View {
       
        if current_game.current_setting == "player_count" {
            PlayerCount(current_game: current_game)
                .transition(.zoomEffect)
        }  // End of starting life page
        
        if current_game.current_setting == "starting_life" {
            StartingLife(current_game: current_game)
                .transition(.zoomEffect)
        }
        
        if current_game.current_setting == "optional" {
            OptionalSettings(current_game: current_game)
                .transition(.zoomEffect)
        }
    }
}


#Preview {
    StartGameSettings(current_game: ActiveGame(player_count: 4, starting_life: 40))
}
