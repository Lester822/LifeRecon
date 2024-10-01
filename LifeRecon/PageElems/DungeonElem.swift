//
//  DungeonElem.swift
//  LifeRecon
//
//  Created by Michael Stang on 10/1/24.
//

import SwiftUI

struct DungeonElem: View {
    @ObservedObject var current_game: ActiveGame

    var body: some View {
        if current_game.caller.current_dungeon == "Dungeon_MadMage" {
            Dungeon_MadMage(current_game: current_game)
        } else if current_game.caller.current_dungeon == "Dungeon_Phandelver" {
            Dungeon_Phandelver(current_game: current_game, caller: current_game.caller)
        } else if current_game.caller.current_dungeon == "Dungeon_Tomb" {
            Dungeon_Tomb(current_game: current_game)
        } else if current_game.caller.current_dungeon == "Dungeon_Undercity" {
            Dungeon_Undercity(current_game: current_game)
        }
    }
}

struct Dungeon_MadMage: View {
    @ObservedObject var current_game: ActiveGame

    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct Dungeon_Phandelver: View {
    @ObservedObject var current_game: ActiveGame
    @ObservedObject var caller: Player

    var body: some View {
        ZStack {
            // Hit Checking
            VStack {
                
                // Cave Entrance
                Button {
                    if caller.dungeon_position != "_CaveEntrance" {
                        withAnimation {
                            caller.dungeon_position = "_CaveEntrance"
                        }
                        
                    } else {
                        withAnimation {
                            caller.dungeon_position = ""
                        }
                        
                    }
                    
                } label: {
                    Rectangle()
                        .padding(0.0)
                        .frame(width:(619/745)*UIScreen.main.bounds.width*0.65, height: (147/1040)*UIScreen.main.bounds.height*0.45)
                }
                .padding(-2.0)
                .buttonStyle(OpacityButton())
                
                // Goblin Lair & Mine Tunnels
                HStack {
                    
                    // GOBLIN LAIR
                    Button {
                        print("HIT GOBLIN LAIR")
                        if caller.dungeon_position != "_GoblinLair" {
                            withAnimation {
                                caller.dungeon_position = "_GoblinLair"
                            }
                            
                        } else {
                            withAnimation {
                                caller.dungeon_position = ""
                            }
                            
                        }
                    } label: {
                        Rectangle()
                            .padding(0.0)
                            .frame(width:(619/745)*UIScreen.main.bounds.width*0.63/2, height: (147/1040)*UIScreen.main.bounds.height*0.55)
                    }
                    .padding(-2.0)
                    .buttonStyle(OpacityButton())
                    
                    // MINE TUNNELS
                    Button {
                        print("HIT MINE TUNNELS")
                        if caller.dungeon_position != "_MineTunnels" {
                            withAnimation {
                                caller.dungeon_position = "_MineTunnels"
                            }
                            
                        } else {
                            withAnimation {
                                caller.dungeon_position = ""
                            }
                            
                        }
                    } label: {
                        Rectangle()
                            .padding(0.0)
                            .frame(width:(619/745)*UIScreen.main.bounds.width*0.63/2, height: (147/1040)*UIScreen.main.bounds.height*0.55)
                    }
                    .padding(-2.0)
                    .buttonStyle(OpacityButton())
                }
                
                // STOREROOM // DARK POOL // FUNGI CAVERN
                
                HStack {
                    
                    // STOREROOM
                    Button {
                        print("HIT STOREROOM")
                        if caller.dungeon_position != "_Storeroom" {
                            withAnimation {
                                caller.dungeon_position = "_Storeroom"
                            }
                            
                        } else {
                            withAnimation {
                                caller.dungeon_position = ""
                            }
                            
                        }
                    } label: {
                        Rectangle()
                            .padding(0.0)
                            .frame(width:(619/745)*UIScreen.main.bounds.width*0.39/2, height: (147/1040)*UIScreen.main.bounds.height*0.65)
                    }
                    .padding(-2.0)
                    .buttonStyle(OpacityButton())
                    
                    // DARK POOL
                    Button {
                        print("HIT DARK POOL")
                        if caller.dungeon_position != "_DarkPool" {
                            withAnimation {
                                caller.dungeon_position = "_DarkPool"
                            }
                            
                        } else {
                            withAnimation {
                                caller.dungeon_position = ""
                            }
                            
                        }
                    } label: {
                        Rectangle()
                            .padding(0.0)
                            .frame(width:(619/745)*UIScreen.main.bounds.width*0.46/2, height: (147/1040)*UIScreen.main.bounds.height*0.65)
                    }
                    .padding(-2.0)
                    .buttonStyle(OpacityButton())
                    
                    // FUNGI CAVERN
                    Button {
                        print("HIT FUNGI CAVERN")
                        if caller.dungeon_position != "_FungiCavern" {
                            withAnimation {
                                caller.dungeon_position = "_FungiCavern"
                            }
                            
                        } else {
                            withAnimation {
                                caller.dungeon_position = ""
                            }
                            
                        }
                    } label: {
                        Rectangle()
                            .padding(0.0)
                            .frame(width:(619/745)*UIScreen.main.bounds.width*0.39/2, height: (147/1040)*UIScreen.main.bounds.height*0.65)
                    }
                    .padding(-2.0)
                    .buttonStyle(OpacityButton())
                }
                
                // TEMPLE OF DUMATHOIN
                Button {
                    print("HIT TEMPLE OF DUMATHOIN")
                    if caller.dungeon_position != "_TempleOfDumathoin" {
                        withAnimation {
                            caller.dungeon_position = "_TempleOfDumathoin"
                        }
                        
                    } else {
                        withAnimation {
                            caller.dungeon_position = ""
                        }
                        
                    }
                } label: {
                    Rectangle()
                        .padding(0.0)
                        .frame(width:(619/745)*UIScreen.main.bounds.width*0.65, height: (147/1040)*UIScreen.main.bounds.height*0.45)
                }
                .padding(-2.0)
                .buttonStyle(OpacityButton())
                
                
                
            }
            Image(current_game.caller.current_dungeon)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: UIScreen.main.bounds.height*0.9, height: UIScreen.main.bounds.width*0.9)
                .allowsHitTesting(false)

            Image(current_game.caller.current_dungeon + current_game.caller.dungeon_position)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: UIScreen.main.bounds.height*0.9, height: UIScreen.main.bounds.width*0.9)
                .allowsHitTesting(false)
                .transition(.fade)
            
        }
        
    }
}

struct Dungeon_Tomb: View {
    @ObservedObject var current_game: ActiveGame

    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct Dungeon_Undercity: View {
    @ObservedObject var current_game: ActiveGame

    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    DungeonElem(current_game: ActiveGame(player_count: 4, starting_life: 40))
}
