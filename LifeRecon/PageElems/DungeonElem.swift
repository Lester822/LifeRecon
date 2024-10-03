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
            Dungeon_MadMage(current_game: current_game, caller: current_game.caller)
        } else if current_game.caller.current_dungeon == "Dungeon_Phandelver" {
            Dungeon_Phandelver(current_game: current_game, caller: current_game.caller)
        } else if current_game.caller.current_dungeon == "Dungeon_Tomb" {
            Dungeon_Tomb(current_game: current_game, caller: current_game.caller)
        } else if current_game.caller.current_dungeon == "Dungeon_Undercity" {
            Dungeon_Undercity(current_game: current_game, caller: current_game.caller)
        }
    }
}

struct Dungeon_MadMage: View {
    @ObservedObject var current_game: ActiveGame
    @ObservedObject var caller: Player
    

    var body: some View {
        ZStack {
            Image(caller.current_dungeon)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: UIScreen.main.bounds.height*0.9, height: UIScreen.main.bounds.width*0.9)
                .allowsHitTesting(true)
            
            // INTERACTABLE OBJECTS
            VStack {
                // YAWNING PORTAL
                Button {
                    if caller.dungeon_position != "_YawningPortal" {
                        withAnimation {
                            caller.dungeon_position = "_YawningPortal"
                        }
                        
                    } else {
                        withAnimation {
                            caller.dungeon_position = ""
                        }
                        
                    }
                    
                } label: {
                    Rectangle()
                        .padding(0.0)
                        .frame(width:(619/745)*UIScreen.main.bounds.width*0.65, height: (147/1040)*UIScreen.main.bounds.height*0.18)
                }
                .padding(-2.0)
                .buttonStyle(OpacityButton())
                
                // DUNGEON LEVEL
                Button {
                    if caller.dungeon_position != "_DungeonLevel" {
                        withAnimation {
                            caller.dungeon_position = "_DungeonLevel"
                        }
                        
                    } else {
                        withAnimation {
                            caller.dungeon_position = ""
                        }
                        
                    }
                    
                } label: {
                    Rectangle()
                        .padding(0.0)
                        .frame(width:(619/745)*UIScreen.main.bounds.width*0.65, height: (147/1040)*UIScreen.main.bounds.height*0.18)
                }
                .padding(-1.0)
                .buttonStyle(OpacityButton())
                
                // GOBLIN BAZAAR | Twisted Caverns
                HStack {
                    // GOBLIN BAZAAR
                    Button {
                        if caller.dungeon_position != "_GoblinBazaar" {
                            withAnimation {
                                caller.dungeon_position = "_GoblinBazaar"
                            }
                            
                        } else {
                            withAnimation {
                                caller.dungeon_position = ""
                            }
                            
                        }
                        
                    } label: {
                        Rectangle()
                            .padding(0.0)
                            .frame(width:(619/745)/2*UIScreen.main.bounds.width*0.63, height: (147/1040)*UIScreen.main.bounds.height*0.42)
                    }
                    .padding(-1.0)
                    .buttonStyle(OpacityButton())
                    
                    // TWISTED CAVERNS
                    Button {
                        if caller.dungeon_position != "_TwistedCaverns" {
                            withAnimation {
                                caller.dungeon_position = "_TwistedCaverns"
                            }
                            
                        } else {
                            withAnimation {
                                caller.dungeon_position = ""
                            }
                            
                        }
                        
                    } label: {
                        Rectangle()
                            .padding(0.0)
                            .frame(width:(619/745)/2*UIScreen.main.bounds.width*0.63, height: (147/1040)*UIScreen.main.bounds.height*0.42)
                    }
                    .padding(-1.0)
                    .buttonStyle(OpacityButton())
                }
                
                // LOST LEVEL
                
                Button {
                    if caller.dungeon_position != "_LostLevel" {
                        withAnimation {
                            caller.dungeon_position = "_LostLevel"
                        }
                        
                    } else {
                        withAnimation {
                            caller.dungeon_position = ""
                        }
                        
                    }
                    
                } label: {
                    Rectangle()
                        .padding(0.0)
                        .frame(width:(619/745)*UIScreen.main.bounds.width*0.65, height: (147/1040)*UIScreen.main.bounds.height*0.18)
                }
                .padding(-1.0)
                .buttonStyle(OpacityButton())
                
                // RUNESTONE CAVERNS | MUIRAL'S GRAVEYARD
                HStack {
                    // RUNESTONE CAVERNS
                    Button {
                        if caller.dungeon_position != "_RunestoneCaverns" {
                            withAnimation {
                                caller.dungeon_position = "_RunestoneCaverns"
                            }
                            
                        } else {
                            withAnimation {
                                caller.dungeon_position = ""
                            }
                            
                        }
                        
                    } label: {
                        Rectangle()
                            .padding(0.0)
                            .frame(width:(619/745)/2*UIScreen.main.bounds.width*0.63, height: (147/1040)*UIScreen.main.bounds.height*0.42)
                    }
                    .padding(-1.0)
                    .buttonStyle(OpacityButton())
                    
                    // MUIRAL'S GRAVEYARD
                    Button {
                        if caller.dungeon_position != "_MuiralsGraveyard" {
                            withAnimation {
                                caller.dungeon_position = "_MuiralsGraveyard"
                            }
                            
                        } else {
                            withAnimation {
                                caller.dungeon_position = ""
                            }
                            
                        }
                        
                    } label: {
                        Rectangle()
                            .padding(0.0)
                            .frame(width:(619/745)/2*UIScreen.main.bounds.width*0.63, height: (147/1040)*UIScreen.main.bounds.height*0.42)
                    }
                    .padding(-1.0)
                    .buttonStyle(OpacityButton())
                }
                
                // DEEP MINES
                
                Button {
                    if caller.dungeon_position != "_DeepMines" {
                        withAnimation {
                            caller.dungeon_position = "_DeepMines"
                        }
                        
                    } else {
                        withAnimation {
                            caller.dungeon_position = ""
                        }
                        
                    }
                    
                } label: {
                    Rectangle()
                        .padding(0.0)
                        .frame(width:(619/745)*UIScreen.main.bounds.width*0.65, height: (147/1040)*UIScreen.main.bounds.height*0.18)
                }
                .padding(-1.0)
                .buttonStyle(OpacityButton())
                
                // MAD WIZARD'S LAIR
                
                Button {
                    if caller.dungeon_position != "_MadWizardsLair" {
                        withAnimation {
                            caller.dungeon_position = "_MadWizardsLair"
                        }
                        
                    } else {
                        withAnimation {
                            caller.dungeon_position = ""
                        }
                        
                    }
                    
                } label: {
                    Rectangle()
                        .padding(0.0)
                        .frame(width:(619/745)*UIScreen.main.bounds.width*0.65, height: (147/1040)*UIScreen.main.bounds.height*0.28)
                }
                .padding(-1.0)
                .buttonStyle(OpacityButton())
            
                
            }
            // CARD IMAGE
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

struct Dungeon_Phandelver: View {
    @ObservedObject var current_game: ActiveGame
    @ObservedObject var caller: Player

    var body: some View {
        
        ZStack {
            
            Image(caller.current_dungeon)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: UIScreen.main.bounds.height*0.9, height: UIScreen.main.bounds.width*0.9)
                .allowsHitTesting(true)
            
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

            Image(caller.current_dungeon + caller.dungeon_position)
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
    @ObservedObject var caller: Player

    var body: some View {
        ZStack {
            Image(caller.current_dungeon)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: UIScreen.main.bounds.height*0.9, height: UIScreen.main.bounds.width*0.9)
                .allowsHitTesting(true)
            // INTERACTABLE OBJECTS
            VStack {
                
                // TRAPPED ENTRY
                Button {
                    if caller.dungeon_position != "_TrappedEntry" {
                        withAnimation {
                            caller.dungeon_position = "_TrappedEntry"
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
                
                
                // VEILS OF FEAR | OUBLIETTE
                HStack {
                    
                    // VEILS OF FEAR | SANDFALL CELL
                    VStack {
                        // VEILS OF FEAR
                        Button {
                            if caller.dungeon_position != "_VeilsOfFear" {
                                withAnimation {
                                    caller.dungeon_position = "_VeilsOfFear"
                                }
                                
                            } else {
                                withAnimation {
                                    caller.dungeon_position = ""
                                }
                                
                            }
                        } label: {
                            Rectangle()
                                .padding(0.0)
                                .frame(width:(619/745)*UIScreen.main.bounds.width*0.65/2, height: (147/1040)*UIScreen.main.bounds.height*0.53)
                        }
                        .padding(-2.0)
                        .buttonStyle(OpacityButton())
                        
                        // SANDFALL CELL
                        Button {
                            if caller.dungeon_position != "_SandfallCell" {
                                withAnimation {
                                    caller.dungeon_position = "_SandfallCell"
                                }
                                
                            } else {
                                withAnimation {
                                    caller.dungeon_position = ""
                                }
                                
                            }
                        } label: {
                            Rectangle()
                                .padding(0.0)
                                .frame(width:(619/745)*UIScreen.main.bounds.width*0.65/2, height: (147/1040)*UIScreen.main.bounds.height*0.53)
                        }
                        .padding(-2.0)
                        .buttonStyle(OpacityButton())
                    }
                    // OUBLIETTE
                    Button {
                        if caller.dungeon_position != "_Oubliette" {
                            withAnimation {
                                caller.dungeon_position = "_Oubliette"
                            }
                            
                        } else {
                            withAnimation {
                                caller.dungeon_position = ""
                            }
                            
                        }
                    } label: {
                        Rectangle()
                            .padding(0.0)
                            .frame(width:(619/745)*UIScreen.main.bounds.width*0.65/2, height: (147/1040)*UIScreen.main.bounds.height*1.1)
                    }
                    .padding(-2.0)
                    .buttonStyle(OpacityButton())
                }
                
                // CRADLE OF THE DEATH GOD
                Button {
                    if caller.dungeon_position != "_CradleOfTheDeathGod" {
                        withAnimation {
                            caller.dungeon_position = "_CradleOfTheDeathGod"
                        }
                        
                    } else {
                        withAnimation {
                            caller.dungeon_position = ""
                        }
                        
                    }
                } label: {
                    Rectangle()
                        .padding(0.0)
                        .frame(width:(619/745)*UIScreen.main.bounds.width*0.65, height: (147/1040)*UIScreen.main.bounds.height*0.53)
                }
                .padding(-2.0)
                .buttonStyle(OpacityButton())
            }
            
            // CARD IMAGE
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

struct Dungeon_Undercity: View {
    @ObservedObject var current_game: ActiveGame
    @ObservedObject var caller: Player

    var body: some View {
        ZStack {
            // INTERACTABLE OBJECTS
            VStack {
                
                // SECRET ENTRANCE
                
                // FORGE | LOST WELL
                HStack {
                    
                }
                
                // TRAP | ARENA | STASH
                
                HStack {
                    
                }
                
                // ARCHIVES | CATACOMBS
                
                HStack{
                    
                }
                
                // THRONE OF THE DEAD THREE
                
                
            }
            // CARD IMAGE
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

#Preview {
    DungeonElem(current_game: ActiveGame(player_count: 4, starting_life: 40))
}
