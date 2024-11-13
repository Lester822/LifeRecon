//
//  LifeBlock.swift
//  LifeRecon
//
//  Created by Michael Stang on 4/9/24.
//

import SwiftUI
import UIKit

struct CommanderCountCounter: View {
    @Binding var number: Int
    var block_color: Color
    var type: String
    @ObservedObject var player: Player
    @ObservedObject var current_game: ActiveGame
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                VStack(spacing: 0.0) {
                    Button {
                        soft_pulse()
                        if type == "count_by_one" {
                            withAnimation(.easeIn(duration: 0.3)) {
                                number += 1
                            }
                        } else if type == "commander_count" {
                            withAnimation(.easeIn(duration: 0.3)) {
                                number = number == 2 ? 1 : 2
                            }
                        }
                        
                    } label: {
                        UnevenRoundedRectangle(cornerRadii: .init(
                            topLeading: geometry.size.width * 0.18,
                            bottomLeading: 00.0,
                            bottomTrailing: 00.0,
                            topTrailing: geometry.size.width * 0.18),
                            style: .continuous)
                        .padding(.all, 0.0)
                        //.frame(height: geometry.size.width / 2)
                        .foregroundColor(block_color)
                        .frame(width: geometry.size.width/1.8)
                    }
                    
                    Button {
                        soft_pulse()
                        if type == "count_by_one" {
                            withAnimation(.easeIn(duration: 0.3)) {
                                number -= 1
                            }
                        } else if type == "commander_count" {
                            withAnimation(.easeIn(duration: 0.3)) {
                                number = number == 2 ? 1 : 2
                            }
                        }
                    } label: {
                        UnevenRoundedRectangle(cornerRadii: .init(
                            topLeading: 00.0,
                            bottomLeading: geometry.size.width * 0.18,
                            bottomTrailing: geometry.size.width * 0.18,
                            topTrailing: 00.0),
                            style: .continuous)
                        .padding(.all, 0.0)
                        //.frame(height: geometry.size.width / 2)
                        .foregroundColor(block_color)
                        .frame(width: geometry.size.width/1.8)
                    }
                }
                //.frame(width: geometry.size.width)
                
                Text(String(number))
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                    .padding(0.0)
                    .allowsHitTesting(false)
                    .font(.system(size: geometry.size.width * 0.3))
            }
            .padding(0.0)
            .frame(maxWidth: .infinity, alignment: .center)
            //.frame(width: geometry.size.width, height: geometry.size.width) // Ensure square shape
        }
        .aspectRatio(1.3, contentMode: .fit) // Maintain aspect ratio
    }
}

#Preview {
    CommanderCountCounter(number: .constant(10), block_color: .red, type: "count_by_one",player: Player(life_total: 30, name: "PLAYER 1"), current_game: ActiveGame(player_count: 4, starting_life: 40))
}
