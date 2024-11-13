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
                .frame(width: UIScreen.main.bounds.width * 0.85, height: UIScreen.main.bounds.height * 0.8)
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
                        
                        if current_game.caller.active_counters.contains("poison") {
                            CounterCounter(icon: "PoisonCount", number: $current_game.caller.poison_counters)
                        }
                        
                        if current_game.caller.active_counters.contains("energy") {
                            CounterCounter(icon: "EnergyCount", number: $current_game.caller.energy_counters)
                        }
                        
                        if current_game.caller.active_counters.contains("storm") {
                            CounterCounter(icon: "StormCount", number: $current_game.caller.storm_count)
                        }
                        
                        if current_game.caller.active_counters.contains("experience") {
                            CounterCounter(icon: "ExperienceCount", number: $current_game.caller.experience_counters)
                        }
                        
                        if current_game.caller.active_counters.contains("rad") {
                            CounterCounter(icon: "RadCount", number: $current_game.caller.rad_counters)
                        }
                        
                        if current_game.caller.active_counters.contains("ticket") {
                            CounterCounter(icon: "TicketCount", number: $current_game.caller.ticket_counters)
                        }
                        
                        if current_game.caller.active_counters.contains("acorn") {
                            CounterCounter(icon: "AcornCount", number: $current_game.caller.acorn_counters)
                        }
                        
                        
                        // UNCLICKED SECTION
                                                
                        if !current_game.caller.active_counters.contains("poison") {
                            CounterCounter(icon: "PoisonCount", number: $current_game.caller.poison_counters)
                        }
                        
                        if !current_game.caller.active_counters.contains("energy") {
                            CounterCounter(icon: "EnergyCount", number: $current_game.caller.energy_counters)
                        }
                        
                        if !current_game.caller.active_counters.contains("storm") {
                            CounterCounter(icon: "StormCount", number: $current_game.caller.storm_count)
                        }
                        
                        if !current_game.caller.active_counters.contains("experience") {
                            CounterCounter(icon: "ExperienceCount", number: $current_game.caller.experience_counters)
                        }
                        
                        if !current_game.caller.active_counters.contains("rad") {
                            CounterCounter(icon: "RadCount", number: $current_game.caller.rad_counters)
                        }
                        
                        if !current_game.caller.active_counters.contains("ticket") {
                            CounterCounter(icon: "TicketCount", number: $current_game.caller.ticket_counters)
                        }
                        
                        if !current_game.caller.active_counters.contains("acorn") {
                            CounterCounter(icon: "AcornCount", number: $current_game.caller.acorn_counters)
                        }
                        
                    }
                }
                .frame(alignment: .center)
                .padding(.horizontal, UIScreen.main.bounds.width * 0.4975)
                    
                ScrollView(.vertical) {
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
                    Button {
                        current_game.showing_player_menu = false
                        current_game.blur_background = false
                        current_game.showing_commander_damage = true
                        
                    } label: {
                        MenuSelector(current_game: current_game, text: "Commander Damage", icon: "CommanderIcon")
                            .frame(width: UIScreen.main.bounds.width * 0.597, height: UIScreen.main.bounds.height * 0.0686, alignment: .center)
                    }
                    
                }
                .padding(10)
                .frame(height: UIScreen.main.bounds.height * 0.2288)
                
                Spacer()
                    .frame(height: UIScreen.main.bounds.height * 0.0114)
                
                    HStack { // Mana Floating
                        
                        VStack {
                            HStack {
                                NumberCircle(number: $current_game.caller.white_mana, block_color: .yellow, player: current_game.caller, current_game: current_game, type: "mana")
                                    .frame(width: UIScreen.main.bounds.height * 0.0915, height: UIScreen.main.bounds.height * 0.0915)
                                NumberCircle(number: $current_game.caller.blue_mana, block_color: .blue, player: current_game.caller, current_game: current_game, type: "mana")
                                    .frame(width: UIScreen.main.bounds.height * 0.0915, height: UIScreen.main.bounds.height * 0.0915)
                                NumberCircle(number: $current_game.caller.black_mana, block_color: .black, player: current_game.caller, current_game: current_game, type: "mana")
                                    .frame(width: UIScreen.main.bounds.height * 0.0915, height: UIScreen.main.bounds.height * 0.0915)
                            }
                            HStack {
                                NumberCircle(number: $current_game.caller.red_mana, block_color: .red, player: current_game.caller, current_game: current_game, type: "mana")
                                    .frame(width: UIScreen.main.bounds.height * 0.0915, height: UIScreen.main.bounds.height * 0.0915)
                                NumberCircle(number: $current_game.caller.green_mana, block_color: .green, player: current_game.caller, current_game: current_game, type: "mana")
                                    .frame(width: UIScreen.main.bounds.height * 0.0915, height: UIScreen.main.bounds.height * 0.0915)
                                NumberCircle(number: $current_game.caller.colorless_mana, block_color: .gray, player: current_game.caller, current_game: current_game, type: "mana")
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
