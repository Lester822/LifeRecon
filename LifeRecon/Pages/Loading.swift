//
//  Loading.swift
//  LifeRecon
//
//  Created by Michael Stang on 4/9/24.
//

import SwiftUI
import UIKit


struct Loading: View {
    @ObservedObject var current_game: ActiveGame
    
    var body: some View {
        VStack (content: {
            Image("LifeReconLong")
                .resizable(resizingMode: .stretch)
                .frame(width: 140*1.75, height: 52.4*1.75)
            HStack {
                Text("by")
                    .font(.headline)
                    .multilineTextAlignment(.center)
                Spacer()
                    .frame(width: 10.0)
                Image("ReconLogo")
                    .resizable(resizingMode: .stretch)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100.0, height: 100.0)
                    .foregroundStyle(.tint)
            }
            Spacer()
                .frame(height: 60.0)
            Button {
                withAnimation {
                    haptic_pulse()
                    current_game.current_setting = "player_count"
                    current_game.current_page = "settings"
                }
            } label: {
                HomeScreenKey(given_text: "Start Game", color: .white, background: .gray)
            }
            if current_game.in_progress == true {
                Button {
                    withAnimation {
                        haptic_pulse()
                        if current_game.player_count == 1 {
                            withAnimation{
                                current_game.current_page = "one_player"
                            }
                        } else if current_game.player_count == 2 {
                            withAnimation{
                                current_game.current_page = "two_player"
                            }
                        } else if current_game.player_count == 3 {
                            withAnimation{
                                current_game.current_page = "three_player"
                            }
                        } else if current_game.player_count == 4 {
                            withAnimation{
                                current_game.current_page = "four_player"
                            }
                        } else if current_game.player_count == 5 {
                            withAnimation{
                                current_game.current_page = "five_player"
                            }
                        }
                    }
                } label: {
                    HomeScreenKey(given_text: "Resume Game", color: .white, background: .green)
                }
            }
        })
    }
}


#Preview {
    Loading(current_game: ActiveGame(player_count: 4, starting_life: 40))
}
