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
                .foregroundStyle(.white)
            Text("Choose the number of players")
                .foregroundStyle(.white)
            Spacer()
                .frame(height: 40.0)
            HStack {
                VStack {
                    
                    Button {
                        current_game.in_progress = false
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
                        Button_Square(button_color: .black, text_color: .white, title: "1", icon: "NONE")
                    }
                    .buttonStyle(JumpButton())
                    
                    
                    Button {
                        current_game.in_progress = false
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
                        Button_Square(button_color: .black, text_color: .white, title: "3", icon: "NONE")
                        
                    }
                    .buttonStyle(JumpButton())
                }
                
                VStack {
                    
                    Button {
                        current_game.in_progress = false
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
                        Button_Square(button_color: .black, text_color: .white, title: "2", icon: "NONE")
                    }
                    .buttonStyle(JumpButton())
                    
                    Button {
                        current_game.in_progress = false
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
                        Button_Square(button_color: .black, text_color: .white, title: "4", icon: "NONE")
                    }
                    .buttonStyle(JumpButton())
//                    Button {
//                        withAnimation(.easeInOut(duration: 0.2)) {
//                            current_game.players[0].rotation = 90
//                            current_game.players[1].rotation = -90
//                            current_game.players[2].rotation = 90
//                            current_game.players[3].rotation = -90
//                            current_game.players[4].rotation = 0
//                            let generator = UIImpactFeedbackGenerator(style: .medium)
//                            generator.prepare()
//                            generator.impactOccurred()
//                            current_game.player_count = 5
//                            withAnimation {
//                                current_game.current_setting = "starting_life"
//                            }
//                            
//                        }
//                    } label: {
//                        SquareButton(button_color: .black, text_color: .white, title: "5", icon: "NONE")
//                    }

                }
            }
            Spacer()
                .frame(height: 40.0)
            Button {
                heavy_haptic_pulse()
                current_game.current_page = "home"
            } label: {
                Image("BackButton")
                    .resizable(resizingMode: .stretch)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: UIScreen.main.bounds.width * 0.1668, height: UIScreen.main.bounds.width * 0.1668)
            }
            .buttonStyle(JumpButton())
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
                .foregroundStyle(.white)
            Text("Choose what life to start at")
                .foregroundStyle(.white)
            Spacer()
                .frame(height: 40.0)
            StartingLifekeypad(current_text: "40", current_game: current_game)
            Spacer()
                .frame(height: 40.0)
            Button {
                withAnimation {
                    heavy_haptic_pulse()
                    current_game.current_setting = "player_count"
                }
            } label: {
                Image("BackButton")
                    .resizable(resizingMode: .stretch)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: UIScreen.main.bounds.width * 0.1668, height: UIScreen.main.bounds.width * 0.1668)
            }
            .buttonStyle(JumpButton())
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
                .foregroundStyle(.white)
            Text("Change various aspects of the game")
                .foregroundStyle(.white)
            Spacer()
                .frame(height: 40.0)
            
            HStack { // Commander Features
                Text("Commander Features")
                    .multilineTextAlignment(.trailing)
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding(.leading, 10.0)
                Spacer()
                    .frame(width: 20.0)
                Toggle_DualToggle(text_for_true: "On", text_for_false: "Off", toggle: $current_game.commander_features_enabled, current_game: current_game, player: Player(life_total: 40, name: "No"))
                    .frame(width: UIScreen.main.bounds.width * 0.5, height: UIScreen.main.bounds.height * 0.05)
                
            } // Commander Features
            
            
            Button {
                medium_haptic_pulse()
                current_game.in_progress = true
                current_game.showing_circle_menu = false
                current_game.showing_commander_damage = false
                current_game.showing_dice_tray = false
                current_game.day_night = ""
                var index = 1
                for player in current_game.players {
                    player.life_total = current_game.starting_life
                    player.name = "PLAYER " + String(index)
                    player.player_number = index
                    if index == 1 {
                        player.background_color = base_red
                    } else if index == 2 {
                        player.background_color = base_blue
                    } else if index == 3 {
                        player.background_color = base_green
                    } else if index == 4 {
                        player.background_color = base_orange
                    } else if index == 5 {
                        player.background_color = base_purple
                    }
                    index += 1
                    player.white_mana = 0
                    player.blue_mana = 0
                    player.black_mana = 0
                    player.red_mana = 0
                    player.green_mana = 0
                    player.commander_count = 1
                    player.commander_damage = [[0,0],[0,0],[0,0],[0,0],[0,0]]
                    player.storm_count = 0
                    player.poison_counters = 0
                    player.rad_counters = 0
                    player.experience_counters = 0
                    player.energy_counters = 0
                    player.ticket_counters = 0
                    player.acorn_counters = 0
                    player.reset_floating_each_time = false
                    
                    player.subtract_life_with_cmdr_damage = false
                    
                    player.current_dungeon = ""
                    player.dungeon_position = ""
                    player.completed_dungeons = []
                    player.ring_stage = 0
                    
                    player.is_monarch = false
                    player.has_initiative = false
                    player.has_cities_blessing = false
                    
                    player.commander_tax_1 = 0
                    player.commander_tax_2 = 0
                    
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
                Key_Large(given_text: "Start", color: .white, background: .red)
            }
            Spacer()
                .frame(height: 40.0)
            Button {
                withAnimation {
                    heavy_haptic_pulse()
                    current_game.current_setting = "starting_life"
                }
            } label: {
                Image("BackButton")
                    .resizable(resizingMode: .stretch)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: UIScreen.main.bounds.width * 0.1668, height: UIScreen.main.bounds.width * 0.1668)
            }
            .buttonStyle(JumpButton())
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
