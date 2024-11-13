//
//  PlayerMenu.swift
//  LifeRecon
//
//  Created by Michael Stang on 5/27/24.
//

import SwiftUI

struct PlayerMenu: View {
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
                .frame(width: UIScreen.main.bounds.height * 0.85, height: UIScreen.main.bounds.width * 0.9)
                .foregroundColor(.black)
                .opacity(0.5)
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
                            }
                        } label: {
                            Button_AdvancedFeatureSelection(current_game: current_game, text: "Dungeon Delver", icon: "DungeonIcon")
                                .frame(width: UIScreen.main.bounds.width * 0.397, height: UIScreen.main.bounds.height * 0.0586)
                        }
                        Button {
                            // Your action here
                        } label: {
                            Button_AdvancedFeatureSelection(current_game: current_game, text: "Ring Tracker", icon: "RingIcon")
                                .frame(width: UIScreen.main.bounds.width * 0.397, height: UIScreen.main.bounds.height * 0.0586)
                        }
                        if current_game.commander_features_enabled {
                            Button {
                                current_game.showing_player_menu = false
                                current_game.blur_background = false
                                current_game.showing_commander_damage = true
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
                                .frame(width: UIScreen.main.bounds.width * 0.1368, height: UIScreen.main.bounds.width * 0.1368)
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
    
    struct NameEditView: View {
        @State var starting_name: String
        @Binding var playerName: String
        @Binding var isEditingName: Bool
        @FocusState private var isTextFieldFocused: Bool
        var onCommit: () -> Void
        
        func cleanup() {
            //        if playerName.count > 10 {
            //            let index = playerName.index(playerName.startIndex, offsetBy: 15)
            //            playerName = String(playerName[..<index]) + "..."
            //        }
            if playerName.replacingOccurrences(of: " ", with: "") == "" {
                playerName = starting_name
            }
            return
        }
        
        var body: some View {
            
            VStack {
                Text("Change Name")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                Text("Change your player name")
                ZStack {
                    RoundedRectangle(cornerRadius: 25.0)
                        .frame(height: 50)
                        .foregroundColor(Color(red: 69, green: 69, blue: 69))
                        .overlay(
                            RoundedRectangle(cornerRadius: 25.0)
                                .stroke(Color.red, lineWidth: 5)
                        )
                    TextField("Enter name", text: $playerName, onCommit: {
                        isEditingName = false
                        cleanup()
                        onCommit()
                        
                        
                    })
                    //.textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                    .foregroundColor(.gray)
                    .focused($isTextFieldFocused) // Bind the focus state to the text field
                    //.onAppear {
                    //isTextFieldFocused = true // Set the focus //when the view appears
                    //}
                }
                
                
                HStack {  // Button stack
                    Button { // Submit Button
                        isEditingName = false
                        cleanup()
                        onCommit()
                        
                        
                    } label: {
                        Key_Large(given_text: "Submit", color: .white, background: .red)
                    }
                    
                    Button {  // Cancel Button
                        playerName = starting_name
                        isEditingName = false
                    } label: {
                        Key_Large(given_text: "Cancel", color: .red, background: .white)
                    }
                }  // Button stack end
                
                .padding()
            }
            .padding()
        }
    }

#Preview {
    PlayerMenu(current_game: ActiveGame(player_count: 4, starting_life: 40))
}
