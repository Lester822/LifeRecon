//
//  PlayerMenu.swift
//  LifeRecon
//
//  Created by Michael Stang on 5/27/24.
//

import SwiftUI

struct PlayerMenuVert: View {
    @ObservedObject var current_game: ActiveGame
    @ObservedObject var current_player: Player
    @State private var isEditingName = false
    @State private var playerName: String
    
    init(current_game: ActiveGame) {
        self.current_game = current_game
        self._playerName = State(initialValue: current_game.caller.name)
        self.current_player = current_game.caller
    }
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25.0)
                //.fill(LinearGradient(gradient: Gradient(colors: [.black, current_game.caller.background_color]), startPoint: .top, endPoint: .bottom))
                .frame(width: UIScreen.main.bounds.width * 0.85, height: UIScreen.main.bounds.height * 0.85)
                .foregroundColor(.black)
                .opacity(0.6)
                .allowsHitTesting(true)
            

            Spacer()
                .frame(width: UIScreen.main.bounds.height * 0.75, height: UIScreen.main.bounds.width * 0.6)
            
            
            VStack {  // Main Contents Container
                
                HStack {
                    Spacer()
                        .frame(width: UIScreen.main.bounds.width * 0.1243)
                    Text(playerName)
                        .bold()
                        .font(.system(size: UIScreen.main.bounds.width * 0.0621))
                        .onTapGesture {
                            isEditingName = true
                        }
                        .foregroundColor(.white)
                    Button {
                        isEditingName = true
                    } label: {
                        Image("Settings")
                            .resizable(resizingMode: .stretch)
                            .frame(width: UIScreen.main.bounds.width * 0.1243, height: UIScreen.main.bounds.width * 0.1243)
                    }
                }
                .padding(-5.0)
                
                HStack {
                    Toggle_Single_Circle(toggle: $current_game.caller.is_monarch, icon: "MonarchIcon", type: "monarch", current_game: current_game)
                        .frame(width: UIScreen.main.bounds.height * 0.055, height: UIScreen.main.bounds.height * 0.055)
                    Toggle_Single_Circle(toggle: $current_game.caller.has_initiative, icon: "InitiativeIcon", type: "initiative", current_game: current_game)
                        .frame(width: UIScreen.main.bounds.height * 0.055, height: UIScreen.main.bounds.height * 0.055)
                    Toggle_Circle(toggle: $current_game.caller.has_cities_blessing, icon: "CitiesBlessingIcon", current_game: current_game)
                        .frame(width: UIScreen.main.bounds.height * 0.055, height: UIScreen.main.bounds.height * 0.055)
                    DayNightToggle(toggle: $current_game.day_night, current_game: current_game)
                        .frame(width: UIScreen.main.bounds.height * 0.055, height: UIScreen.main.bounds.height * 0.055)
                }
                
                
                Spacer()
                    .frame(height: 20.0)
                
                ScrollView(.horizontal) {
                    HStack {
                        if current_game.commander_features_enabled  {
                            if current_game.caller.active_counters.contains("commandercount") {
                                Counter_GameCounters(icon: "CommanderCountIcon", add_amount: -1, number: $current_game.caller.commander_count)
                                    .frame(width: UIScreen.main.bounds.height * 0.08)
                            }
                            if current_game.caller.active_counters.contains("commandertax1") {
                                Counter_GameCounters(icon: "CommanderTax1", add_amount: 2, number: $current_game.caller.commander_tax_1)
                                    .frame(width: UIScreen.main.bounds.height * 0.08)
                            }
                            
                            if current_game.caller.active_counters.contains("commandertax2") {
                                if current_game.caller.commander_count > 1 {
                                    Counter_GameCounters(icon: "CommanderTax2", add_amount: 2, number: $current_game.caller.commander_tax_2)
                                        .frame(width: UIScreen.main.bounds.height * 0.08)
                                }
                            }
                            
                            
                        }
                        if current_game.caller.active_counters.contains("poison") {
                            Counter_GameCounters(icon: "PoisonCount", add_amount: 1, number: $current_game.caller.poison_counters)
                                .frame(width: UIScreen.main.bounds.width * 0.1741)
                        }
                        if current_game.caller.active_counters.contains("energy") {
                            Counter_GameCounters(icon: "EnergyCount", add_amount: 1, number: $current_game.caller.energy_counters)
                                .frame(width: UIScreen.main.bounds.width * 0.1741)
                        }
                        
                        if current_game.caller.active_counters.contains("storm") {
                            Counter_GameCounters(icon: "StormCount", add_amount: 1, number: $current_game.caller.storm_count)
                                .frame(width: UIScreen.main.bounds.width * 0.1741)
                        }
                        
                        if current_game.caller.active_counters.contains("experience") {
                            Counter_GameCounters(icon: "ExperienceCount", add_amount: 1, number: $current_game.caller.experience_counters)
                                .frame(width: UIScreen.main.bounds.width * 0.1741)
                        }
                        
                        if current_game.caller.active_counters.contains("rad") {
                            Counter_GameCounters(icon: "RadCount", add_amount: 1, number: $current_game.caller.rad_counters)
                                .frame(width: UIScreen.main.bounds.width * 0.1741)
                        }
                        
                        if current_game.caller.active_counters.contains("ticket") {
                            Counter_GameCounters(icon: "TicketCount", add_amount: 1, number: $current_game.caller.ticket_counters)
                                .frame(width: UIScreen.main.bounds.width * 0.1741)
                        }
                        
                        if current_game.caller.active_counters.contains("acorn") {
                            Counter_GameCounters(icon: "AcornCount", add_amount: 1, number: $current_game.caller.acorn_counters)
                                .frame(width: UIScreen.main.bounds.width * 0.1741)
                        }
                        
                        
                        // UNCLICKED SECTION
                        if current_game.commander_features_enabled {
                            if !current_game.caller.active_counters.contains("commandercount") {
                                Counter_GameCounters(icon: "CommanderCountIcon", add_amount: -1, number: $current_game.caller.commander_count)
                                    .frame(width: UIScreen.main.bounds.height * 0.08)
                            }
                            if !current_game.caller.active_counters.contains("commandertax1") {
                                Counter_GameCounters(icon: "CommanderTax1", add_amount: 2, number: $current_game.caller.commander_tax_1)
                                    .frame(width: UIScreen.main.bounds.height * 0.08)
                            }
                            if !current_game.caller.active_counters.contains("commandertax2") {
                                if current_game.caller.commander_count > 1 {
                                    Counter_GameCounters(icon: "CommanderTax2", add_amount: 2, number: $current_game.caller.commander_tax_2)
                                        .frame(width: UIScreen.main.bounds.height * 0.08)
                                }
                            }
                            
                        }
                        
                        if !current_game.caller.active_counters.contains("poison") {
                            Counter_GameCounters(icon: "PoisonCount", add_amount: 1, number: $current_game.caller.poison_counters)
                                .frame(width: UIScreen.main.bounds.width * 0.1741)
                        }
                        
                        if !current_game.caller.active_counters.contains("energy") {
                            Counter_GameCounters(icon: "EnergyCount", add_amount: 1, number: $current_game.caller.energy_counters)
                                .frame(width: UIScreen.main.bounds.width * 0.1741)
                        }
                        
                        if !current_game.caller.active_counters.contains("storm") {
                            Counter_GameCounters(icon: "StormCount", add_amount: 1, number: $current_game.caller.storm_count)
                                .frame(width: UIScreen.main.bounds.width * 0.1741)
                        }
                        
                        if !current_game.caller.active_counters.contains("experience") {
                            Counter_GameCounters(icon: "ExperienceCount", add_amount: 1, number: $current_game.caller.experience_counters)
                                .frame(width: UIScreen.main.bounds.width * 0.1741)
                        }
                        
                        if !current_game.caller.active_counters.contains("rad") {
                            Counter_GameCounters(icon: "RadCount", add_amount: 1, number: $current_game.caller.rad_counters)
                                .frame(width: UIScreen.main.bounds.width * 0.1741)
                        }
                        
                        if !current_game.caller.active_counters.contains("ticket") {
                            Counter_GameCounters(icon: "TicketCount", add_amount: 1, number: $current_game.caller.ticket_counters)
                                .frame(width: UIScreen.main.bounds.width * 0.1741)
                        }
                        
                        if !current_game.caller.active_counters.contains("acorn") {
                            Counter_GameCounters(icon: "AcornCount", add_amount: 1, number: $current_game.caller.acorn_counters)
                                .frame(width: UIScreen.main.bounds.width * 0.1741)
                        }
                        
                    }
                }
                .frame(width: UIScreen.main.bounds.width * 0.597, height: UIScreen.main.bounds.height * 0.1144, alignment: .center)
                
                ScrollView(.vertical) {
                    VStack {
                        Button {
                            withAnimation {
                                current_game.showing_dungeon = true
                                medium_haptic_pulse()
                            }
                        } label: {
                            Button_AdvancedFeatureSelection(current_game: current_game, text: "Dungeon Delver", icon: "DungeonIcon")
                                .frame(width: UIScreen.main.bounds.width * 0.597, height: UIScreen.main.bounds.height * 0.0686, alignment: .center)
                        }
                        Button {
                            withAnimation {
                                current_game.showing_ring = true
                                medium_haptic_pulse()
                            }
                            
                        } label: {
                            Button_AdvancedFeatureSelection(current_game: current_game, text: "Ring Tracker", icon: "RingIcon")
                                .frame(width: UIScreen.main.bounds.width * 0.597, height: UIScreen.main.bounds.height * 0.0686, alignment: .center)
                        }
                        if current_game.commander_features_enabled {
                            Button {
                                current_game.showing_player_menu = false
                                current_game.blur_background = false
                                current_game.showing_commander_damage = true
                                medium_haptic_pulse()
                                
                            } label: {
                                Button_AdvancedFeatureSelection(current_game: current_game, text: "Commander Damage", icon: "CommanderIcon")
                                    .frame(width: UIScreen.main.bounds.width * 0.597, height: UIScreen.main.bounds.height * 0.0686, alignment: .center)
                            }
                        }
                        
                    }
                    .frame(height: UIScreen.main.bounds.height * 0.2288, alignment: current_game.commander_features_enabled ? .top : .center)
                }
                .padding(10)
                .frame(height: UIScreen.main.bounds.height * 0.2288, alignment: current_game.commander_features_enabled ? .top : .center)
                
                Spacer()
                    .frame(height: UIScreen.main.bounds.height * 0.0114)
                
                    HStack { // Mana Floating
                        
                        VStack {
                            HStack {
                                Counter_Circle(number: $current_game.caller.white_mana, block_color: magic_white, player: current_game.caller, current_game: current_game, type: "mana")
                                    .frame(width: UIScreen.main.bounds.height * 0.0915, height: UIScreen.main.bounds.height * 0.0915)
                                Counter_Circle(number: $current_game.caller.blue_mana, block_color: magic_blue, player: current_game.caller, current_game: current_game, type: "mana")
                                    .frame(width: UIScreen.main.bounds.height * 0.0915, height: UIScreen.main.bounds.height * 0.0915)
                                Counter_Circle(number: $current_game.caller.black_mana, block_color: magic_black, player: current_game.caller, current_game: current_game, type: "mana")
                                    .frame(width: UIScreen.main.bounds.height * 0.0915, height: UIScreen.main.bounds.height * 0.0915)
                            }
                            HStack {
                                Counter_Circle(number: $current_game.caller.red_mana, block_color: magic_red, player: current_game.caller, current_game: current_game, type: "mana")
                                    .frame(width: UIScreen.main.bounds.height * 0.0915, height: UIScreen.main.bounds.height * 0.0915)
                                Counter_Circle(number: $current_game.caller.green_mana, block_color: magic_green, player: current_game.caller, current_game: current_game, type: "mana")
                                    .frame(width: UIScreen.main.bounds.height * 0.0915, height: UIScreen.main.bounds.height * 0.0915)
                                Counter_Circle(number: $current_game.caller.colorless_mana, block_color: magic_colorless, player: current_game.caller, current_game: current_game, type: "mana")
                                    .frame(width: UIScreen.main.bounds.height * 0.0915, height: UIScreen.main.bounds.height * 0.0915)
                            }
                            HStack {
                                Button {
                                                            
                                } label: {
                                    Toggle_Circle(toggle: $current_game.caller.reset_floating_each_time, icon:"ResetManaOnClose", current_game: current_game)
                                        .frame(width: UIScreen.main.bounds.height * 0.055, height: UIScreen.main.bounds.height * 0.055)
                                }
                                Button {
                                    medium_haptic_pulse()
                                    current_game.caller.white_mana = 0
                                    current_game.caller.blue_mana = 0
                                    current_game.caller.black_mana = 0
                                    current_game.caller.red_mana = 0
                                    current_game.caller.green_mana = 0
                                    current_game.caller.colorless_mana = 0
                                    
                                } label: {
                                    Image("EraseIcon")
                                        .resizable(resizingMode: .stretch)
                                        .frame(width: UIScreen.main.bounds.height * 0.0629, height: UIScreen.main.bounds.height * 0.0629)
                                }
                            }
                        }
                    }
                    .frame(width: UIScreen.main.bounds.width * 0.597)
                }
            }
            .sheet(isPresented: $isEditingName) {
                PlayerSettingsPage(player: current_game.caller, current_game: current_game, editing_name: playerName, player_name: $playerName, showing_player_settings: $isEditingName) {
                    current_game.caller.name = playerName
                    
                }
            }
        }
    }


#Preview {
    PlayerMenuVert(current_game: ActiveGame(player_count: 4, starting_life: 40))
}
