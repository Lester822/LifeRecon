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
    @State private var showing_app_settings = false
    @State private var showing_app_info = false
    
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
                    heavy_haptic_pulse()
                    withAnimation {
                        current_game.current_page = "settings"
                    }
                    current_game.commander_features_enabled = false
                    
                } label: {
                    Key_HomeScreen(given_text: "Start Game", color: .white, background: .black)
                }
                .buttonStyle(JumpButton())
                if current_game.in_progress == true {
                    Button {
                        withAnimation {
                            heavy_haptic_pulse()
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
                    .buttonStyle(JumpButton())
                }
                Spacer()
                    .frame(height: 10)
                HStack{
                    Button {
                        showing_app_settings = true
                    } label : {
                        Image("Settings")
                            .resizable(resizingMode: .stretch)
                            .frame(width: 50.0, height: 50.0)
                    }
                    Button {
                        showing_app_info = true
                    } label : {
                        Image("Info")
                            .resizable(resizingMode: .stretch)
                            .frame(width: 50.0, height: 50.0)
                    }
                    
                }
                
            })
            .sheet(isPresented: $showing_app_settings) {
                AppSettingsPage(showing_app_settings: $showing_app_settings) {
                    
                }
            }
            .sheet(isPresented: $showing_app_info) {
                InfoPage(showing_app_settings: $showing_app_info) {
                    
                }
            }
            
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
