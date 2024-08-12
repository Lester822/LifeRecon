//
//  ToggleCircle.swift
//  LifeRecon
//
//  Created by Michael Stang on 8/11/24.
//

import SwiftUI

struct SingleToggleCircle: View {
    @Binding var toggle: Bool
    var icon: String
    var type: String
    @ObservedObject var current_game: ActiveGame
    
    var body: some View {
        ZStack {
            
            Button {
                haptic_pulse()
                withAnimation {
                    toggle.toggle()
                }
                
                
                for player in current_game.players {
                    if player !== current_game.caller {
                        if type == "monarch" {
                            withAnimation {
                                player.is_monarch = false
                            }
                        } else if type == "initiative" {
                            withAnimation {
                                player.has_initiative = false
                            }
                        }
                    }
                }
                
            } label: {
                if toggle == true {
                    Circle()
                        .frame(width: 50.0, height: 50.0)
                        .foregroundColor(.orange)
                } else {
                    Circle()
                        .frame(width: 50.0, height: 50.0)
                        .foregroundColor(.black)
                }
                
            }
            VStack {
                Image(icon)
                    .resizable(resizingMode: .stretch)
                    .frame(width: 35.0, height: 35.0)
                    .allowsHitTesting(false)
                Spacer()
                    .frame(height: 3.0)
            }
            
            
            VStack {
                Spacer()
                    .frame(height: 35.0)
                RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                    .frame(width: 10.0, height: 5.0)
                    .foregroundColor(.white)
            }
            
            
        }
        
    }
}

#Preview {
    SingleToggleCircle(toggle: Binding.constant(true), icon: "UnknownIconIcon", type: "monarch", current_game: ActiveGame(player_count: 40, starting_life: 4))
}
