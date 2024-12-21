//
//  LifeBlock.swift
//  LifeRecon
//
//  Created by Michael Stang on 4/9/24.
//

import SwiftUI
import UIKit

struct Counter_CommanderDamageCircle: View {
    @Binding var number: Int
    var block_color: Color
    @ObservedObject var player: Player
    @ObservedObject var current_game: ActiveGame
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Circle()
                    .stroke(.white, lineWidth: 5)
                    .foregroundStyle(Color(red: 1.0, green: 1.0, blue: 1.0, opacity: 0.0))
                    
                VStack(spacing: 0.0) {
                    Button {
                        soft_haptic_pulse()
                        withAnimation(.easeIn(duration: 0.3)) {
                            number += 1
                            if player.subtract_life_with_cmdr_damage {
                                player.life_total -= 1
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
                        .foregroundColor(.white)
                    }
                    .buttonStyle(OpacityButton())
                    
                    Button {
                        soft_haptic_pulse()
                        withAnimation(.easeIn(duration: 0.3)) {
                            number -= 1
                            if player.subtract_life_with_cmdr_damage {
                                player.life_total += 1
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
                        .foregroundColor(.white)
                    }
                    .buttonStyle(OpacityButton())
                }
                //.frame(width: geometry.size.width)
                
                Text(String(number))
                    .font(.system(size: geometry.size.width * 0.3))
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                    .padding(0.0)
                    
            }
            .padding(0.0)
        }
        .aspectRatio(1, contentMode: .fit) // Maintain aspect ratio
    }
}

#Preview {
    Counter_CommanderDamageCircle(number: .constant(10), block_color: .red, player: Player(life_total: 30, name: "PLAYER 1"), current_game: ActiveGame(player_count: 4, starting_life: 40))
}
