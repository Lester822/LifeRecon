//
//  LifeBlock.swift
//  LifeRecon
//
//  Created by Michael Stang on 4/9/24.
//

import SwiftUI

struct LifeBlock: View {
    var block_color: Color
    @ObservedObject var player: Player
    var body: some View {
        ZStack (content: {
            HStack (spacing: 0.0, content: {
                Button {
                    player.life_total = player.life_total - 1
                    player.life_total = player.life_total
                } label: {
                    Rectangle()
                        .padding(.all, 0.0)
                        .foregroundColor(block_color)
                }
                Button {
                    player.life_total = player.life_total + 1
                    player.life_total = player.life_total
                } label: {
                    Rectangle()
                        .padding(.all, 0.0)
                        .foregroundColor(block_color)
                }
                
            })
           
            Text(String(player.life_total))
                .font(.system(size: 80))
                .fontWeight(.bold)
                .foregroundColor(Color.white)
                .padding(.horizontal)
                .rotationEffect(Angle(degrees: 90))
                
        })
    }
}

#Preview {
    LifeBlock(block_color: .red, player: Player(life_total: 30))
}
