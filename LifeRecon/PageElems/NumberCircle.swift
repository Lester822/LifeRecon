//
//  LifeBlock.swift
//  LifeRecon
//
//  Created by Michael Stang on 4/9/24.
//

import SwiftUI
import UIKit

struct NumberCircle: View {
    @Binding var number: Int
    var block_color: Color
    @ObservedObject var player: Player
    @ObservedObject var current_game: ActiveGame
   
    
    var body: some View {
        ZStack {
            VStack(spacing: 0.0) {
                Button {
                    soft_pulse()
                    number += 1
                } label: {
                    UnevenRoundedRectangle(cornerRadii: .init(
                                                                        topLeading: 50.0,
                                                                        bottomLeading: 00.0,
                                                                        bottomTrailing: 00.0,
                                                                        topTrailing: 50.0),
                                           style: .continuous)
                    .padding([.top, .leading, .bottom], 0.0)
                    .frame(width: 80.0, height: 40.0)
                    .foregroundColor(block_color)
                }
                
                Button {
                    soft_pulse()
                    number -= 1
                } label: {
                    UnevenRoundedRectangle(cornerRadii: .init(
                                                                        topLeading: 00.0,
                                                                        bottomLeading: 50.0,
                                                                        bottomTrailing: 50.0,
                                                                        topTrailing: 00.0),
                                           style: .continuous)
                    .padding([.top, .leading, .bottom], 0.0)
                    .frame(width: 80.0, height: 40.0)
                    .foregroundColor(block_color)
                }
                
            }
            Text(String(number))
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(Color.white)
        }
        
        
        
    }
}

#Preview {
    NumberCircle(number:.constant(10), block_color: .red, player: Player(life_total: 30, name: "PLAYER 1"), current_game: ActiveGame(player_count: 4, starting_life: 40))
}
