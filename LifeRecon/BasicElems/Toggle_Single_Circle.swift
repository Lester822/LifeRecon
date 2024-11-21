//
//  ToggleCircle.swift
//  LifeRecon
//
//  Created by Michael Stang on 8/11/24.
//

import SwiftUI

struct Toggle_Single_Circle: View {
    @Binding var toggle: Bool
    var icon: String
    var type: String
    @ObservedObject var current_game: ActiveGame
    
    var body: some View {
        GeometryReader { geometry in
            
            ZStack {
                
                Button {
                    medium_haptic_pulse()
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
                            .foregroundColor(.orange)
                    } else {
                        Circle()
                            .foregroundColor(.black)
                    }
                    
                }
                VStack {
                    Image(icon)
                        .resizable(resizingMode: .stretch)
                        .frame(width: geometry.size.height * 0.7, height: geometry.size.height * 0.7)
                        .allowsHitTesting(false)
                    Spacer()
                        .frame(height: geometry.size.height * 0.06)
                }
                
                
                VStack {
                    Spacer()
                        .frame(height: geometry.size.height * 0.65)
                    RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                        .frame(width: geometry.size.height * 0.2, height: geometry.size.height * 0.07)
                        .foregroundColor(.white)
                }
                
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
            .aspectRatio(1, contentMode: .fit)
            .padding(0.0)
            
        }
    }
}

#Preview {
    Toggle_Single_Circle(toggle: Binding.constant(true), icon: "UnknownIconIcon", type: "monarch", current_game: ActiveGame(player_count: 40, starting_life: 4))
}
