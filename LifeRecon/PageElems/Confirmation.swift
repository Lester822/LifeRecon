//
//  Confirmation.swift
//  LifeRecon
//
//  Created by Michael Stang on 4/26/24.
//

import SwiftUI

struct Confirmation: View {
    @ObservedObject var current_game: ActiveGame
    var confirm_text: String
    
    var body: some View {
        ZStack (content: {
            RoundedRectangle(cornerRadius:30)
                .frame(width: 300.0, height: 150.0)
                .foregroundColor(.black)
                .opacity(/*@START_MENU_TOKEN@*/0.8/*@END_MENU_TOKEN@*/)
                .edgesIgnoringSafeArea(.all)
            VStack {
                Text(current_game.first_confirm_line)
                    .fontWeight(.black)
                    .foregroundColor(Color.white)
                Text(confirm_text)
                    .fontWeight(.black)
                    .foregroundColor(Color.white)
                Spacer()
                    .frame(width: 10.0, height: 10.0)
                HStack {
                    Button {
                        current_game.last_confirm = false
                        current_game.confirm_message = ""
                        current_game.showing_confirm = false
                        
                    } label: {
                        LargeKey(given_text: "No", color: .black, background: .white)
                    }
                    
                    Button {
                        current_game.confirm_message = ""
                        current_game.showing_confirm = false
                        current_game.last_confirm = true
                        if current_game.confirm_action == "reset" {
                            reset_game()
                        }
                    } label: {
                        LargeKey(given_text: "Yes", color: .black, background: .green)
                    }
                    
                }
            }
            
        })
    }
    
    func reset_game() {
        withAnimation {
            current_game.showing_circle_menu = false
            for player in current_game.players {
                player.life_total = current_game.starting_life
                current_game.showing_commander_damage = false
                current_game.showing_circle_menu = false
                player.white_mana = 0
                player.blue_mana = 0
                player.black_mana = 0
                player.red_mana = 0
                player.green_mana = 0
                player.commander_damage = []
                player.commander_count = 1
                for _ in current_game.players {
                    player.commander_damage.append([0])
                }
                
            }
        }
    }
}

#Preview {
    Confirmation(current_game: ActiveGame(player_count: 4, starting_life: 40), confirm_text: "end the game")
}
