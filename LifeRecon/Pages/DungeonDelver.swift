//
//  DungeonDelver.swift
//  LifeRecon
//
//  Created by Michael Stang on 10/3/24.
//

import SwiftUI

struct DungeonDelver: View {
    @ObservedObject var current_game: ActiveGame
    @ObservedObject var caller: Player

    var body: some View {
        if caller.current_dungeon == "" {
            VStack{
                Text("Dungeon Delver")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .foregroundStyle(.orange)
                Text("Choose a dungeon to venture into")
                    .foregroundStyle(.white)
                HStack {
                    Button {
                        caller.current_dungeon = "Dungeon_MadMage"
                    } label: {
                        Image("Dungeon_MadMage")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: UIScreen.main.bounds.width*0.4)
                            .allowsHitTesting(true)
                            .shadow(color: .green, radius: caller.completed_dungeons.contains("Dungeon_MadMage") ? 10 : 0)
                    }
                    Button {
                        caller.current_dungeon = "Dungeon_Phandelver"
                    } label: {
                        Image("Dungeon_Phandelver")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: UIScreen.main.bounds.width*0.4)
                            .allowsHitTesting(true)
                            .shadow(color: .green, radius: caller.completed_dungeons.contains("Dungeon_Phandelver") ? 10 : 0)
                    }
                    Button {
                        caller.current_dungeon = "Dungeon_Tomb"
                    } label: {
                        Image("Dungeon_Tomb")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: UIScreen.main.bounds.width*0.4)
                            .allowsHitTesting(true)
                            .shadow(color: .green, radius: caller.completed_dungeons.contains("Dungeon_Tomb") ? 10 : 0)
                    }
                    
                    Spacer()
                        .frame(width: UIScreen.main.bounds.width*0.1)
                    
                    Button {
                        caller.current_dungeon = "Dungeon_Undercity"
                    } label: {
                        Image("Dungeon_Undercity")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: UIScreen.main.bounds.width*0.4)
                            .allowsHitTesting(true)
                            .shadow(color: .green, radius: caller.completed_dungeons.contains("Dungeon_Undercity") ? 10 : 0)
                    }
                    
                }
            }
            
        } else { // IF the person is in a dungeon
            ZStack {
                VStack {
//                    Spacer()
//                        .frame(height: UIScreen.main.bounds.width*0.05)
                    DungeonElem(current_game: current_game)
                }
                
                HStack {
                    Spacer()
                        .frame(width: UIScreen.main.bounds.width*1.2)
                    VStack {
                        HStack {
                            if caller.dungeon_position == "" {
                                Button {
                                    caller.current_dungeon = ""
                                    caller.dungeon_position = ""
                                } label: {
                                    Image("AbandonIcon")
                                        .resizable(resizingMode: .stretch)
                                        .frame(width: 55.0, height: 55.0)
                                }
                                Text("Abandon Dungeon")
                                    .padding(.leading, -5.0)
                                    .foregroundStyle(.white)
                                    .fontWeight(.heavy)
                            }
                            

                        }
                        HStack {
                            if ["_MadWizardsLair", "_TempleOfDumathoin", "_CradleOfTheDeathGod","_ThroneOfTheDeadThree"].contains(caller.dungeon_position){
                                Button {
                                    caller.completed_dungeons.insert(caller.current_dungeon)
                                    caller.current_dungeon = ""
                                    caller.dungeon_position = ""
                                    
                                } label: {
                                    Image("CompleteIcon")
                                        .resizable(resizingMode: .stretch)
                                        .frame(width: 55.0, height: 55.0)
                                }
                                Text("Complete Dungeon")
                                    .padding(.leading, -5.0)
                                    .foregroundStyle(.white)
                                    .fontWeight(.heavy)
                            }
                            

                        }
                    }
                    
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
        }
    }
}

#Preview {
    DungeonDelver(current_game: ActiveGame(player_count: 4, starting_life: 10), caller: Player(life_total: 10, name: "Player 1"))
}
