//
//  PlayerMenu.swift
//  LifeRecon
//
//  Created by Michael Stang on 5/27/24.
//

import SwiftUI

struct PlayerMenu: View {
    @ObservedObject var current_game: ActiveGame
    @ObservedObject var current_player: Player
    @State private var showing_player_settings = false
    @State private var player_name: String
    
    init(current_game: ActiveGame) {
        self.current_game = current_game
        self._player_name = State(initialValue: current_game.caller.name)
        self.current_player = current_game.caller
    }
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25.0)
                //.fill(LinearGradient(gradient: Gradient(colors: [.black, current_game.caller.background_color]), startPoint: .top, endPoint: .bottom))
                .frame(width: UIScreen.main.bounds.height * 0.85, height: UIScreen.main.bounds.width * 0.9)
                .foregroundColor(.black)
                .opacity(0.6)
                .allowsHitTesting(true)
            
            // Toggle Row
            VStack {
                HStack {
                    Spacer()
                        .frame(width: UIScreen.main.bounds.height * 0.75)
                    VStack {
                        Toggle_Single_Circle(toggle: $current_game.caller.is_monarch, icon: "MonarchIcon", type: "monarch", current_game: current_game)
                            .padding(.bottom, 3.0)
                            .frame(width: UIScreen.main.bounds.width * 0.1168, height: UIScreen.main.bounds.width * 0.1168)
                        Toggle_Single_Circle(toggle: $current_game.caller.has_initiative, icon: "InitiativeIcon", type: "initiative", current_game: current_game)
                            .padding(.bottom, 3.0)
                            .frame(width: UIScreen.main.bounds.width * 0.1168, height: UIScreen.main.bounds.width * 0.1168)
                        Toggle_Circle(toggle: $current_game.caller.has_cities_blessing, icon: "CitiesBlessingIcon", current_game: current_game)
                            .padding(.bottom, 3.0)
                            .frame(width: UIScreen.main.bounds.width * 0.1168, height: UIScreen.main.bounds.width * 0.1168)
                        DayNightToggle(toggle: $current_game.day_night, current_game: current_game)
                            .padding(.bottom, 3.0)
                            .frame(width: UIScreen.main.bounds.width * 0.1168, height: UIScreen.main.bounds.width * 0.1168)
                    }
                }
//                Spacer()
//                    .frame(height: UIScreen.main.bounds.width * 0.28)
            }
            // Toggle Row End
            
            // Scroll Long Bar
        
            
    
            VStack {  // Main Contents Container
                Spacer()
                    .frame(height: UIScreen.main.bounds.width * 0.0249)
                HStack {
                    Spacer()
                        .frame(width: UIScreen.main.bounds.width * 0.1243)
                    Text(player_name)
                        .bold()
                        .font(.system(size: UIScreen.main.bounds.width * 0.0621))
                        .onTapGesture {
                            showing_player_settings = true
                        }
                        .foregroundColor(.white)
                    Button {
                        showing_player_settings = true
                    } label: {
                        Image("Settings")
                            .resizable(resizingMode: .stretch)
                            .frame(width: UIScreen.main.bounds.width * 0.1243, height: UIScreen.main.bounds.width * 0.1243)
                    }
                }
                
                HStack {

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
                                    .frame(width: UIScreen.main.bounds.height * 0.08)
                            }
                            
                            if current_game.caller.active_counters.contains("energy") {
                                Counter_GameCounters(icon: "EnergyCount", add_amount: 1, number: $current_game.caller.energy_counters)
                                    .frame(width: UIScreen.main.bounds.height * 0.08)
                            }
                            
                            if current_game.caller.active_counters.contains("storm") {
                                Counter_GameCounters(icon: "StormCount", add_amount: 1, number: $current_game.caller.storm_count)
                                    .frame(width: UIScreen.main.bounds.height * 0.08)
                            }
                            
                            if current_game.caller.active_counters.contains("experience") {
                                Counter_GameCounters(icon: "ExperienceCount", add_amount: 1, number: $current_game.caller.experience_counters)
                                    .frame(width: UIScreen.main.bounds.height * 0.08)
                            }
                            
                            if current_game.caller.active_counters.contains("rad") {
                                Counter_GameCounters(icon: "RadCount", add_amount: 1, number: $current_game.caller.rad_counters)
                                    .frame(width: UIScreen.main.bounds.height * 0.08)
                            }
                            
                            if current_game.caller.active_counters.contains("ticket") {
                                Counter_GameCounters(icon: "TicketCount", add_amount: 1, number: $current_game.caller.ticket_counters)
                                    .frame(width: UIScreen.main.bounds.height * 0.08)
                            }
                            
                            if current_game.caller.active_counters.contains("acorn") {
                                Counter_GameCounters(icon: "AcornCount", add_amount: 1, number: $current_game.caller.acorn_counters)
                                    .frame(width: UIScreen.main.bounds.height * 0.08)
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
                                    .frame(width: UIScreen.main.bounds.height * 0.08)
                            }
                            
                            if !current_game.caller.active_counters.contains("energy") {
                                Counter_GameCounters(icon: "EnergyCount", add_amount: 1, number: $current_game.caller.energy_counters)
                                    .frame(width: UIScreen.main.bounds.height * 0.08)
                            }
                            
                            if !current_game.caller.active_counters.contains("storm") {
                                Counter_GameCounters(icon: "StormCount", add_amount: 1, number: $current_game.caller.storm_count)
                                    .frame(width: UIScreen.main.bounds.height * 0.08)
                            }
                            
                            if !current_game.caller.active_counters.contains("experience") {
                                Counter_GameCounters(icon: "ExperienceCount", add_amount: 1, number: $current_game.caller.experience_counters)
                                    .frame(width: UIScreen.main.bounds.height * 0.08)
                            }
                            
                            if !current_game.caller.active_counters.contains("rad") {
                                Counter_GameCounters(icon: "RadCount", add_amount: 1, number: $current_game.caller.rad_counters)
                                    .frame(width: UIScreen.main.bounds.height * 0.08)
                            }
                            
                            if !current_game.caller.active_counters.contains("ticket") {
                                Counter_GameCounters(icon: "TicketCount", add_amount: 1, number: $current_game.caller.ticket_counters)
                                    .frame(width: UIScreen.main.bounds.height * 0.08)
                            }
                            
                            if !current_game.caller.active_counters.contains("acorn") {
                                Counter_GameCounters(icon: "AcornCount", add_amount: 1, number: $current_game.caller.acorn_counters)
                                    .frame(width: UIScreen.main.bounds.height * 0.08)
                            }
                            
                        }
                        .frame(height: UIScreen.main.bounds.width * 0.2488, alignment: .center)
                    }
                    .frame(width: UIScreen.main.bounds.height * 0.5432, alignment: .center)

                }
                
//                Spacer()
//                    .frame(height: UIScreen.main.bounds.width * 0.0995)
                
                ScrollView(.horizontal) {
                    HStack {
                        Button {
                            withAnimation {
                                current_game.showing_dungeon = true
                                medium_haptic_pulse()
                            }
                        } label: {
                            Button_AdvancedFeatureSelection(current_game: current_game, text: "Dungeon Delver", icon: "DungeonIcon")
                                .frame(width: UIScreen.main.bounds.width * 0.397, height: UIScreen.main.bounds.height * 0.0586)
                        }
                        Button {
                            withAnimation {
                                current_game.showing_ring = true
                                medium_haptic_pulse()
                            }
                        } label: {
                            Button_AdvancedFeatureSelection(current_game: current_game, text: "Ring Tracker", icon: "RingIcon")
                                .frame(width: UIScreen.main.bounds.width * 0.397, height: UIScreen.main.bounds.height * 0.0586)
                        }
                        if current_game.commander_features_enabled {
                            Button {
                                current_game.showing_player_menu = false
                                current_game.blur_background = false
                                current_game.showing_commander_damage = true
                                medium_haptic_pulse()
                            } label: {
                                Button_AdvancedFeatureSelection(current_game: current_game, text: "Commander Damage", icon: "CommanderIcon")
                                    .frame(width: UIScreen.main.bounds.width * 0.397, height: UIScreen.main.bounds.height * 0.0586)
                            }
                        }
                    }
                    .frame(width: UIScreen.main.bounds.height * 0.5432, alignment: current_game.commander_features_enabled ? .leading : .center) // Set HStack width to match ScrollView
                }
                .frame(width: UIScreen.main.bounds.height * 0.5432, alignment: .center)
                .padding(10)
                
                    HStack { // Mana Floating
                        
                        Button {
                            
                        } label: {
                            Toggle_Circle(toggle: $current_game.caller.reset_floating_each_time, icon:"ResetManaOnClose", current_game: current_game)
                                .frame(width: UIScreen.main.bounds.width * 0.1168, height: UIScreen.main.bounds.width * 0.1168)
                        }
                        Counter_Circle(number: $current_game.caller.white_mana, block_color: magic_white, player: current_game.caller, current_game: current_game, type: "mana")
                            .frame(width: UIScreen.main.bounds.width * 0.1493, height: UIScreen.main.bounds.width * 0.1493)
                        Counter_Circle(number: $current_game.caller.blue_mana, block_color: magic_blue, player: current_game.caller, current_game: current_game, type: "mana")
                            .frame(width: UIScreen.main.bounds.width * 0.1493, height: UIScreen.main.bounds.width * 0.1493)
                        Counter_Circle(number: $current_game.caller.black_mana, block_color: magic_black, player: current_game.caller, current_game: current_game, type: "mana")
                            .frame(width: UIScreen.main.bounds.width * 0.1493, height: UIScreen.main.bounds.width * 0.1493)
                        Counter_Circle(number: $current_game.caller.red_mana, block_color: magic_red, player: current_game.caller, current_game: current_game, type: "mana")
                            .frame(width: UIScreen.main.bounds.width * 0.1493, height: UIScreen.main.bounds.width * 0.1493)
                        Counter_Circle(number: $current_game.caller.green_mana, block_color: magic_green, player: current_game.caller, current_game: current_game, type: "mana")
                            .frame(width: UIScreen.main.bounds.width * 0.1493, height: UIScreen.main.bounds.width * 0.1493)
                        Counter_Circle(number: $current_game.caller.colorless_mana, block_color: magic_colorless, player: current_game.caller, current_game: current_game, type: "mana")
                            .frame(width: UIScreen.main.bounds.width * 0.1493, height: UIScreen.main.bounds.width * 0.1493)
                        
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
                                .frame(width: UIScreen.main.bounds.width * 0.1368, height: UIScreen.main.bounds.width * 0.1368)
                        }
                        
                        
                    }
                    
                }
            }
            .sheet(isPresented: $showing_player_settings) {
                PlayerSettingsPage(player: current_game.caller, current_game: current_game, editing_name: player_name, player_name: $player_name, showing_player_settings: $showing_player_settings) {
                    current_game.caller.name = player_name
                    
                }
            }
        }
    }
    
    struct PlayerSettingsPage: View {
        @State var player: Player
        @State var current_game: ActiveGame
        @State var editing_name: String
        @Binding var player_name: String
        @Binding var showing_player_settings: Bool
        var onCommit: () -> Void
        
        func cleanup() {
            if !(editing_name.replacingOccurrences(of: " ", with: "") == "") {
                player_name = editing_name
            }
            return
        }
        
        var body: some View {
            
            VStack {
                Text("Player Settings")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                
                Spacer()
                    .frame(height: UIScreen.main.bounds.height * 0.05)
                
                Text("Player Name")
                    .font(.title2)
                    .fontWeight(.bold)

                ZStack {
                    RoundedRectangle(cornerRadius: 25.0)
                        .padding(.horizontal, 20.0)
                        .frame(height: 50)
                        .foregroundColor(Color(red: 69, green: 69, blue: 69))
                        .overlay(
                            RoundedRectangle(cornerRadius: 25.0)
                                .stroke(.red, lineWidth: 5)
                                .padding(.horizontal, 20.0)
                        )
                    
                    HStack {
                        TextField("Enter name", text: $editing_name, onCommit: {
                            cleanup()
                            onCommit()
                        })
                        .padding(.horizontal, 35.0)
                        .foregroundColor(.gray)
                        Spacer()
                            .frame(width: (UIScreen.main.bounds.width * 0.02) + 100)
                    }
                    
                    HStack {
                        Spacer()
                        Button { // Submit Button
                            soft_haptic_pulse()
                            cleanup()
                            onCommit()
                        } label: {
                            Key_LargeRounded(given_text: "Apply", color: .white, background: .red)
                        }
                        .buttonStyle(JumpGreenButton())
                        Spacer()
                            .frame(width: (UIScreen.main.bounds.width * 0.02) + 20)
                    }
                    
                }
                
                HStack { // VERTICAL VS HORIZONTAL
                    Text("Increment Direction")
                        .multilineTextAlignment(.trailing)
                        .font(.title2)
                        .fontWeight(.bold)
                        .padding(.leading, 10.0)
                    Spacer()
                        .frame(width: 20.0)
                    Toggle_DualToggle(text_for_true: "Vertical", text_for_false: "Horizontal", toggle: $player.vertical_increment, current_game: current_game, player: player)
                        .frame(width: UIScreen.main.bounds.width * 0.5, height: UIScreen.main.bounds.height * 0.05)
                    
                } // VERTICAL VS HORIZONTAL
                
            }
            .padding()
        }
    }

#Preview {
    PlayerMenu(current_game: ActiveGame(player_count: 4, starting_life: 40))
}
