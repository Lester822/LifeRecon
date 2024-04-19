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
            HStack {
                Text("LifeRecon by")
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
            HStack {
                Button {
                    withAnimation(.easeInOut(duration: 0.2)) {
                        let generator = UIImpactFeedbackGenerator(style: .medium)
                        generator.prepare()
                        current_game.current_page = "four_player"
                        generator.impactOccurred()
                        if current_game.player_count != 4 {
                            for player in self.current_game.players {
                                player.life_total = player.starting_life
                            }
                            current_game.player_count = 4
                        }
                        
                    }
                } label: {
                    SquareButton(button_color: .gray, text_color: .white, title: "4 Players", icon: "FourPlayer")
                }
                Button {
                    withAnimation(.easeInOut(duration: 0.2)) {
                        let generator = UIImpactFeedbackGenerator(style: .medium)
                        generator.prepare()
                        current_game.current_page = "three_player"
                        generator.impactOccurred()
                        if current_game.player_count != 3 {
                            for player in self.current_game.players {
                                player.life_total = player.starting_life
                            }
                            current_game.player_count = 3
                        }
                        
                        
                    }
                } label: {
                    SquareButton(button_color: .gray, text_color: .white, title: "3 Players", icon: "ThreePlayer")
                    
                }
                Button {
                    withAnimation(.easeInOut(duration: 0.2)) {
                        let generator = UIImpactFeedbackGenerator(style: .medium)
                        generator.prepare()
                        current_game.current_page = "two_player"
                        generator.impactOccurred()
                        if current_game.player_count != 2 {
                            for player in self.current_game.players {
                                player.life_total = player.starting_life
                            }
                            current_game.player_count = 2
                        }
                        
                    }
                } label: {
                    SquareButton(button_color: .gray, text_color: .white, title: "2 Players", icon: "TwoPlayer")
                }
            }
        })
    }
}


#Preview {
    Loading(current_game: ActiveGame(player_count: 4, starting_life: 40))
}
