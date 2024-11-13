//
//  PlayerMenu.swift
//  LifeRecon
//
//  Created by Michael Stang on 5/27/24.
//

import SwiftUI

struct PlayerMenuVert: View {
    @ObservedObject var current_game: ActiveGame
    @State private var isEditingName = false
    @State private var playerName: String
    
    init(current_game: ActiveGame) {
        self.current_game = current_game
        self._playerName = State(initialValue: current_game.caller.name)
    }
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25.0)
                .frame(width: UIScreen.main.bounds.width * 0.85, height: UIScreen.main.bounds.height * 0.85)
                .foregroundColor(.black)
                .opacity(0.5)
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
                    SingleToggleCircle(toggle: $current_game.caller.is_monarch, icon: "MonarchIcon", type: "monarch", current_game: current_game)
                        .frame(width: UIScreen.main.bounds.height * 0.055, height: UIScreen.main.bounds.height * 0.055)
                    SingleToggleCircle(toggle: $current_game.caller.has_initiative, icon: "InitiativeIcon", type: "initiative", current_game: current_game)
                        .frame(width: UIScreen.main.bounds.height * 0.055, height: UIScreen.main.bounds.height * 0.055)
                    ToggleCircle(toggle: $current_game.caller.has_cities_blessing, icon: "CitiesBlessingIcon", current_game: current_game)
                        .frame(width: UIScreen.main.bounds.height * 0.055, height: UIScreen.main.bounds.height * 0.055)
                }
                
                
                Spacer()
                    .frame(height: 20.0)
                
                ScrollView(.horizontal) {
                    HStack {
                        if current_game.commander_features_enabled  {
                            if current_game.caller.active_counters.contains("commandercount") {
                                CounterCounter(icon: "CommanderCountIcon", add_amount: -1, number: $current_game.caller.commander_count)
                                    .frame(width: UIScreen.main.bounds.height * 0.08)
                            }
                            if current_game.caller.active_counters.contains("commandertax1") {
                                CounterCounter(icon: "CommanderTax1", add_amount: 2, number: $current_game.caller.commander_tax_1)
                                    .frame(width: UIScreen.main.bounds.height * 0.08)
                            }
                            
                            if current_game.caller.active_counters.contains("commandertax2") {
                                if current_game.caller.commander_count > 1 {
                                    CounterCounter(icon: "CommanderTax2", add_amount: 2, number: $current_game.caller.commander_tax_2)
                                        .frame(width: UIScreen.main.bounds.height * 0.08)
                                }
                            }
                            
                            
                        }
                        if current_game.caller.active_counters.contains("poison") {
                            CounterCounter(icon: "PoisonCount", add_amount: 1, number: $current_game.caller.poison_counters)
                                .frame(width: UIScreen.main.bounds.width * 0.1741)
                        }
                        if current_game.caller.active_counters.contains("energy") {
                            CounterCounter(icon: "EnergyCount", add_amount: 1, number: $current_game.caller.energy_counters)
                                .frame(width: UIScreen.main.bounds.width * 0.1741)
                        }
                        
                        if current_game.caller.active_counters.contains("storm") {
                            CounterCounter(icon: "StormCount", add_amount: 1, number: $current_game.caller.storm_count)
                                .frame(width: UIScreen.main.bounds.width * 0.1741)
                        }
                        
                        if current_game.caller.active_counters.contains("experience") {
                            CounterCounter(icon: "ExperienceCount", add_amount: 1, number: $current_game.caller.experience_counters)
                                .frame(width: UIScreen.main.bounds.width * 0.1741)
                        }
                        
                        if current_game.caller.active_counters.contains("rad") {
                            CounterCounter(icon: "RadCount", add_amount: 1, number: $current_game.caller.rad_counters)
                                .frame(width: UIScreen.main.bounds.width * 0.1741)
                        }
                        
                        if current_game.caller.active_counters.contains("ticket") {
                            CounterCounter(icon: "TicketCount", add_amount: 1, number: $current_game.caller.ticket_counters)
                                .frame(width: UIScreen.main.bounds.width * 0.1741)
                        }
                        
                        if current_game.caller.active_counters.contains("acorn") {
                            CounterCounter(icon: "AcornCount", add_amount: 1, number: $current_game.caller.acorn_counters)
                                .frame(width: UIScreen.main.bounds.width * 0.1741)
                        }
                        
                        
                        // UNCLICKED SECTION
                        if current_game.commander_features_enabled {
                            if !current_game.caller.active_counters.contains("commandercount") {
                                CounterCounter(icon: "CommanderCountIcon", add_amount: -1, number: $current_game.caller.commander_count)
                                    .frame(width: UIScreen.main.bounds.height * 0.08)
                            }
                            if !current_game.caller.active_counters.contains("commandertax1") {
                                CounterCounter(icon: "CommanderTax1", add_amount: 2, number: $current_game.caller.commander_tax_1)
                                    .frame(width: UIScreen.main.bounds.height * 0.08)
                            }
                            if !current_game.caller.active_counters.contains("commandertax2") {
                                if current_game.caller.commander_count > 1 {
                                    CounterCounter(icon: "CommanderTax2", add_amount: 2, number: $current_game.caller.commander_tax_2)
                                        .frame(width: UIScreen.main.bounds.height * 0.08)
                                }
                            }
                            
                        }
                        
                        if !current_game.caller.active_counters.contains("poison") {
                            CounterCounter(icon: "PoisonCount", add_amount: 1, number: $current_game.caller.poison_counters)
                                .frame(width: UIScreen.main.bounds.width * 0.1741)
                        }
                        
                        if !current_game.caller.active_counters.contains("energy") {
                            CounterCounter(icon: "EnergyCount", add_amount: 1, number: $current_game.caller.energy_counters)
                                .frame(width: UIScreen.main.bounds.width * 0.1741)
                        }
                        
                        if !current_game.caller.active_counters.contains("storm") {
                            CounterCounter(icon: "StormCount", add_amount: 1, number: $current_game.caller.storm_count)
                                .frame(width: UIScreen.main.bounds.width * 0.1741)
                        }
                        
                        if !current_game.caller.active_counters.contains("experience") {
                            CounterCounter(icon: "ExperienceCount", add_amount: 1, number: $current_game.caller.experience_counters)
                                .frame(width: UIScreen.main.bounds.width * 0.1741)
                        }
                        
                        if !current_game.caller.active_counters.contains("rad") {
                            CounterCounter(icon: "RadCount", add_amount: 1, number: $current_game.caller.rad_counters)
                                .frame(width: UIScreen.main.bounds.width * 0.1741)
                        }
                        
                        if !current_game.caller.active_counters.contains("ticket") {
                            CounterCounter(icon: "TicketCount", add_amount: 1, number: $current_game.caller.ticket_counters)
                                .frame(width: UIScreen.main.bounds.width * 0.1741)
                        }
                        
                        if !current_game.caller.active_counters.contains("acorn") {
                            CounterCounter(icon: "AcornCount", add_amount: 1, number: $current_game.caller.acorn_counters)
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
                            }
                        } label: {
                            MenuSelector(current_game: current_game, text: "Dungeon Delver", icon: "DungeonIcon")
                                .frame(width: UIScreen.main.bounds.width * 0.597, height: UIScreen.main.bounds.height * 0.0686, alignment: .center)
                        }
                        Button {
                            
                        } label: {
                            MenuSelector(current_game: current_game, text: "Ring Tracker", icon: "RingIcon")
                                .frame(width: UIScreen.main.bounds.width * 0.597, height: UIScreen.main.bounds.height * 0.0686, alignment: .center)
                        }
                        if current_game.commander_features_enabled {
                            Button {
                                current_game.showing_player_menu = false
                                current_game.blur_background = false
                                current_game.showing_commander_damage = true
                                
                            } label: {
                                MenuSelector(current_game: current_game, text: "Commander Damage", icon: "CommanderIcon")
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
                                NumberCircle(number: $current_game.caller.white_mana, block_color: magic_white, player: current_game.caller, current_game: current_game, type: "mana")
                                    .frame(width: UIScreen.main.bounds.height * 0.0915, height: UIScreen.main.bounds.height * 0.0915)
                                NumberCircle(number: $current_game.caller.blue_mana, block_color: magic_blue, player: current_game.caller, current_game: current_game, type: "mana")
                                    .frame(width: UIScreen.main.bounds.height * 0.0915, height: UIScreen.main.bounds.height * 0.0915)
                                NumberCircle(number: $current_game.caller.black_mana, block_color: magic_black, player: current_game.caller, current_game: current_game, type: "mana")
                                    .frame(width: UIScreen.main.bounds.height * 0.0915, height: UIScreen.main.bounds.height * 0.0915)
                            }
                            HStack {
                                NumberCircle(number: $current_game.caller.red_mana, block_color: magic_red, player: current_game.caller, current_game: current_game, type: "mana")
                                    .frame(width: UIScreen.main.bounds.height * 0.0915, height: UIScreen.main.bounds.height * 0.0915)
                                NumberCircle(number: $current_game.caller.green_mana, block_color: magic_green, player: current_game.caller, current_game: current_game, type: "mana")
                                    .frame(width: UIScreen.main.bounds.height * 0.0915, height: UIScreen.main.bounds.height * 0.0915)
                                NumberCircle(number: $current_game.caller.colorless_mana, block_color: magic_colorless, player: current_game.caller, current_game: current_game, type: "mana")
                                    .frame(width: UIScreen.main.bounds.height * 0.0915, height: UIScreen.main.bounds.height * 0.0915)
                            }
                            HStack {
                                Button {
                                                            
                                } label: {
                                    ToggleCircle(toggle: $current_game.caller.reset_floating_each_time, icon:"ResetManaOnClose", current_game: current_game)
                                        .frame(width: UIScreen.main.bounds.height * 0.055, height: UIScreen.main.bounds.height * 0.055)
                                }
                                Button {
                                    haptic_pulse()
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
                NameEditView(starting_name: playerName, playerName: $playerName, isEditingName: $isEditingName) {
                    current_game.caller.name = playerName
                    
                }
            }
        }
    }


#Preview {
    PlayerMenuVert(current_game: ActiveGame(player_count: 4, starting_life: 40))
}
