//
//  CircleMenu.swift
//  LifeRecon
//
//  Created by Michael Stang on 4/11/24.
//

import SwiftUI

struct CircleMenu: View {
    var current_game: ActiveGame
    var body: some View {
        ZStack() {
            Circle()
                .frame(width: 300.0, height: 300.0)
                .opacity(0.2)
            HStack() {
                Button {
                    current_game.showing_circle_menu = false
                    for player in current_game.players {
                        player.life_total = current_game.starting_life
                    }
                    
                } label: {
                    Image("Restart")
                        .resizable(resizingMode: .stretch)
                        .frame(width: 50.0, height: 50.0)
                }
                Spacer()
                    .frame(width: 80.0)
                VStack() {
                    Button("test") {
                        print("test")
                    }
                    Spacer()
                        .frame(width: 0, height: 200.0)
                    Button("test") {
                        print("test")
                    }
                }
                Spacer()
                    .frame(width: 80.0)
                Button("test") {
                    print("test")
                }
            }
        }

    }
}

#Preview {
    CircleMenu(current_game: ActiveGame(player_count: 4, starting_life: 40))
}
