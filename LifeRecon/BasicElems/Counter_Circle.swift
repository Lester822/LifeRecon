//
//  LifeBlock.swift
//  LifeRecon
//
//  Created by Michael Stang on 4/9/24.
//

import SwiftUI
import UIKit

struct Counter_Circle: View {
    @Binding var number: Int
    var block_color: Color
    @ObservedObject var player: Player
    @ObservedObject var current_game: ActiveGame
    var type: String
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                VStack(spacing: 0.0) {
                    Button {
                        soft_haptic_pulse()
                        if type == "mana" {
                            withAnimation(.easeIn(duration: 0.3)) {
                                number += 1
                            }
                        } else if type == "commander_damage" {
                            withAnimation(.easeIn(duration: 0.3)) {
                                number += 1
                                if player.subtract_life_with_cmdr_damage {
                                    player.life_total -= 1
                                }
                            }
                            
                        }
                        
                    } label: {
                        UnevenRoundedRectangle(cornerRadii: .init(
                            topLeading: 5000.0,
                            bottomLeading: 00.0,
                            bottomTrailing: 00.0,
                            topTrailing: 5000.0),
                            style: .continuous)
                        .padding(.all, 0.0)
                        //.frame(height: geometry.size.width / 2)
                        .foregroundColor(block_color)
                    }
                    
                    Button {
                        soft_haptic_pulse()
                        if type == "mana" {
                            withAnimation(.easeIn(duration: 0.3)) {
                                number -= 1
                            }
                        } else if type == "commander_damage" {
                            withAnimation(.easeIn(duration: 0.3)) {
                                number -= 1
                                if player.subtract_life_with_cmdr_damage {
                                    player.life_total += 1
                                }
                            }
                        }
                        
                    } label: {
                        UnevenRoundedRectangle(cornerRadii: .init(
                            topLeading: 00.0,
                            bottomLeading: 5000.0,
                            bottomTrailing: 5000.0,
                            topTrailing: 00.0),
                            style: .continuous)
                        .padding(.all, 0.0)
                        //.frame(height: geometry.size.width / 2)
                        .foregroundColor(block_color)
                    }
                }
                //.frame(width: geometry.size.width)
                
                Text(String(number))
                    .font(.system(size: geometry.size.width * 0.3))
                    .fontWeight(.bold)
                    .foregroundColor(type == "mana" ? Color.black : Color.white)
                    .padding(0.0)
                    
            }
            .padding(0.0)
            //.frame(width: geometry.size.width, height: geometry.size.width) // Ensure square shape
        }
        .aspectRatio(1, contentMode: .fit) // Maintain aspect ratio
    }
}

#Preview {
    Counter_Circle(number: .constant(10), block_color: .red, player: Player(life_total: 30, name: "PLAYER 1"), current_game: ActiveGame(player_count: 4, starting_life: 40), type: "test")
}
