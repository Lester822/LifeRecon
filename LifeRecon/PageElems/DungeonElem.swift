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
        if current_game.caller.current_dungeon == "MadMage" {
            Dungeon_MadMage(current_game: current_game)
        } else if current_game.caller.current_dungeon == "Phandelver" {
            Dungeon_Phandelver(current_game: current_game)
        } else if current_game.caller.current_dungeon == "Tomb" {
            Dungeon_Tomb(current_game: current_game)
        } else if current_game.caller.current_dungeon == "Undercity" {
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

    var body: some View {
        ZStack {
            
            
            // Hit Checking
            VStack {
                Button {
                    print("HIT")
                } label: {
                    Rectangle()
                        .frame(width:(619/745)*UIScreen.main.bounds.width*0.65, height: (147/1040)*UIScreen.main.bounds.height*0.45)
                }
                
                Spacer()
                    .frame(height: UIScreen.main.bounds.height*0.23)
            }
            Image("Dungeon_Phandelver")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: UIScreen.main.bounds.height*0.9, height: UIScreen.main.bounds.width*0.9)
                .allowsHitTesting(false)
            
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
