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
    @ObservedObject var game: ActiveGame
    @State private var showing_alert = false
    @State private var user_input = ""
    @State private var refreshID = UUID()

    
    var body: some View {
        ZStack (content: {
            HStack (spacing: 0.0, content: {
                Button {
                    player.life_total = player.life_total - 1
                    player.life_total = player.life_total
                } label: {
                    UnevenRoundedRectangle(cornerRadii: .init(
                                                                        topLeading: 50.0,
                                                                        bottomLeading: 50.0,
                                                                        bottomTrailing: 00.0,
                                                                        topTrailing: 00.0),
                                           style: .continuous)
                    .padding([.top, .leading, .bottom], 5.0)
                    .foregroundColor(block_color)
                }

                Button {
                    player.life_total = player.life_total + 1
                    player.life_total = player.life_total
                } label: {
                    UnevenRoundedRectangle(cornerRadii: .init(
                        topLeading: 0.0,
                        bottomLeading: 0.0,
                        bottomTrailing: 50.0,
                        topTrailing: 50.0),
                                           style: .continuous)
                    .padding([.top, .bottom, .trailing], 5.0)
                    .foregroundColor(block_color)
                }
                
            })
           
            Text(String(player.life_total))
                .font(.system(size: 80))
                .fontWeight(.bold)
                .foregroundColor(Color.white)
                .minimumScaleFactor(0.1)
                .lineLimit(1)
                .padding()
                .rotationEffect(Angle(degrees: 90))
                .gesture(LongPressGesture(minimumDuration: 0.1).onEnded { _ in
                    withAnimation {
                        game.showing_circle_menu = false
                        game.showing_keypad = true
                        game.caller = self.player
                        print("Click!")
                    }
                })
                
            
        })
    }
}

#Preview {
    LifeBlock(block_color: .red, player: Player(life_total: 30), game: ActiveGame(player_count: 4, starting_life: 40))
}
