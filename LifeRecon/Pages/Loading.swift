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
        ZStack {
            VStack (content: {
                Image("LifeReconLong")
                    .resizable(resizingMode: .stretch)
                    .frame(width: 1920*0.25, height: 1080*0.25)
                Spacer()
                    .frame(height: 30.0)
                Button {
                    withAnimation {
                        current_game.current_setting = "player_count"
                    }
                    haptic_pulse()
                    withAnimation {
                        current_game.current_page = "settings"
                    }
                    current_game.commander_features_enabled = true
                    
                } label: {
                    Key_HomeScreen(given_text: "Start Game", color: .white, background: .black)
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
                        Key_HomeScreen(given_text: "Resume Game", color: .white, background: .red)
                    }
                }
                Spacer()
                    .frame(height: 10)
                HStack{
                    Image("Settings")
                        .resizable(resizingMode: .stretch)
                        .frame(width: 50.0, height: 50.0)
                    Image("Info")
                        .resizable(resizingMode: .stretch)
                        .frame(width: 50.0, height: 50.0)
                }
                
            })
            VStack {
                Spacer()
                Image("ReconLogo")
                    .resizable(resizingMode: .stretch)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 1920.0*0.1, height: 1080.0*0.1)
                    .foregroundStyle(.tint)
            }
        }
        
    }
}


#Preview {
    Loading(current_game: ActiveGame(player_count: 4, starting_life: 40))
}
