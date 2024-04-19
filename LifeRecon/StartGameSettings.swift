//
//  StartGameSettings.swift
//  LifeRecon
//
//  Created by Michael Stang on 4/18/24.
//

import SwiftUI

struct PlayerCount: View {
    @ObservedObject var current_game: ActiveGame
    
    var body: some View {
        VStack {
            Text("Player Count")
                .font(.largeTitle)
                .fontWeight(.heavy)
            Text("Choose the number of players")
            Spacer()
                .frame(height: 40.0)
            HStack {
                VStack {
                    
                    Button {
                        withAnimation(.easeInOut(duration: 0.2)) {
                            let generator = UIImpactFeedbackGenerator(style: .medium)
                            generator.prepare()
                            generator.impactOccurred()
                            if current_game.player_count != 1 {
                                current_game.player_count = 1
                                withAnimation {
                                    current_game.current_setting = "starting_life"
                                }
                            } else {
                                current_game.current_page = "one_player"
                            }
                            
                        }
                        
                    } label: {
                        SquareButton(button_color: .gray, text_color: .white, title: "1", icon: "NONE")
                    }
                    
                    
                    Button {
                        withAnimation(.easeInOut(duration: 0.2)) {
                            let generator = UIImpactFeedbackGenerator(style: .medium)
                            generator.prepare()
                            generator.impactOccurred()
                            if current_game.player_count != 3 {
                                current_game.player_count = 3
                                withAnimation {
                                    current_game.current_setting = "starting_life"
                                }
                            } else {
                                current_game.current_page = "three_player"
                            }
                           
                        }
                    } label: {
                        SquareButton(button_color: .gray, text_color: .white, title: "3", icon: "NONE")
                        
                    }
                }
                
                VStack {
                    
                    Button {
                        withAnimation(.easeInOut(duration: 0.2)) {
                            let generator = UIImpactFeedbackGenerator(style: .medium)
                            generator.prepare()
                            generator.impactOccurred()
                            current_game.player_count = 2
                            if current_game.player_count != 2 {
                                current_game.player_count = 2
                                withAnimation {
                                    current_game.current_setting = "starting_life"
                                }
                            } else {
                                current_game.current_page = "two_player"
                            }
                        }
                    } label: {
                        SquareButton(button_color: .gray, text_color: .white, title: "2", icon: "NONE")
                    }
                    
                    Button {
                        withAnimation(.easeInOut(duration: 0.2)) {
                            let generator = UIImpactFeedbackGenerator(style: .medium)
                            generator.prepare()
                            generator.impactOccurred()
                            if current_game.player_count != 4 {
                                current_game.player_count = 4
                                withAnimation {
                                    current_game.current_setting = "starting_life"
                                }
                            } else {
                                current_game.current_page = "four_player"
                            }
                            
                        }
                    } label: {
                        SquareButton(button_color: .gray, text_color: .white, title: "4", icon: "NONE")
                    }
                }
            }
        }
    }
}
    

struct StartingLife: View {
    @ObservedObject var current_game: ActiveGame
    
    var body: some View {
        VStack {
            Text("Starting Life")
                .font(.largeTitle)
                .fontWeight(.heavy)
            Text("Choose what life to start at")
            Spacer()
                .frame(height: 40.0)
            BasicKeypad(current_text: "40", current_game: current_game)
        }
    }
}


struct OptionalSettings: View {
    @ObservedObject var current_game: ActiveGame
    
    var body: some View {
        VStack {
            Text("Optional Settings")
                .font(.largeTitle)
                .fontWeight(.heavy)
            Text("Change various aspects of the game")
            Spacer()
                .frame(height: 40.0)
            Button {
                current_game.showing_circle_menu = false
                for player in current_game.players {
                    player.life_total = current_game.starting_life
                }
                if current_game.player_count == 1 {
                    withAnimation{
                        current_game.current_page = "one_player"
                    }
                    current_game.current_setting = "player_count"
                } else if current_game.player_count == 2 {
                    withAnimation{
                        current_game.current_page = "two_player"
                    }
                    current_game.current_setting = "player_count"
                } else if current_game.player_count == 3 {
                    withAnimation{
                        current_game.current_page = "three_player"
                    }
                    current_game.current_setting = "player_count"
                } else if current_game.player_count == 4 {
                    withAnimation{
                        current_game.current_page = "four_player"
                    }
                    current_game.current_setting = "player_count"
                }
                
            } label: {
                LargeKey(given_text: "Start", color: .white, background: .red)
            }
        }
    }
}

struct StartGameSettings: View {
    @ObservedObject var current_game: ActiveGame
    
    var body: some View {
       
        if current_game.current_setting == "player_count" {
            PlayerCount(current_game: current_game)
                .transition(.zoomIt)
        }  // End of starting life page
        if current_game.current_setting == "starting_life" {
            StartingLife(current_game: current_game)
                .transition(.zoomIt)
        }
        if current_game.current_setting == "optional" {
            OptionalSettings(current_game: current_game)
                .transition(.zoomIt)
        }
    }
}


#Preview {
    StartGameSettings(current_game: ActiveGame(player_count: 4, starting_life: 40))
}
