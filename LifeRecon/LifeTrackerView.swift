//
//  LifeTrackerView.swift
//  LifeRecon
//
//  Created by Michael Stang on 4/9/24.
//

import SwiftUI

struct LifeTrackerView: View {
    @ObservedObject var current_game: ActiveGame
    var body: some View {
        ZStack(content: {
            VStack (alignment: .center, spacing: 0.0, content: {
                HStack (spacing: 0.0, content: {
                    var life1 = LifeBlock(block_color: .blue, player: current_game.players[0])
                    var life2 = LifeBlock(block_color: .red, player: current_game.players[1])
                        .rotationEffect(Angle(degrees: 180))
                    life1
                    life2
                })
       
                HStack (spacing: 0.0, content: {
                    var life3 = LifeBlock(block_color: .green, player: current_game.players[2])
                    var life4 = LifeBlock(block_color: .yellow, player: current_game.players[3])
                        .rotationEffect(Angle(degrees: 180))
                    life3
                    life4
                    
                })
            })
            .padding(-10)
            Button {
                print("CLICK")
            } label: {
                Image("MenuIcon")
                    .resizable(resizingMode: .stretch)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100.0, height: 100.0)
                    .foregroundStyle(.tint)
                    .rotationEffect(Angle(degrees: 90))
            }
            .simultaneousGesture(
                LongPressGesture(minimumDuration: 0.1).onEnded({_ in
                    print("WOW")
                }))
            
            
            

        })
            
    }
}

#Preview {
    LifeTrackerView(current_game: ActiveGame(player_count: 4))
}
