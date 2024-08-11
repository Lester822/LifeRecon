//
//  PageManager.swift
//  LifeRecon
//
//  Created by Michael Stang on 8/10/24.
//

import SwiftUI

struct PageManager: View {
    @ObservedObject var current_game: ActiveGame
    
    var body: some View {
        
        ZStack { // ZStack to put menus above page
            
            if current_game.current_page == "home" {
                Loading(current_game: current_game)
                    .transition(.zoomIt)
            }
            
            if current_game.current_page == "settings" {
                StartGameSettings(current_game: current_game)
                    .transition(.zoomEffect)
            }
            
            if current_game.current_page == "four_player" {
                FourPlayerGame(current_game: current_game)
                    .transition(.fade)
                    .background(.black)
            }
            
            if current_game.current_page == "three_player" {
                ThreePlayerGame(current_game: current_game)
                    .transition(.fade)
                    .background(.black)
            }
            
            if current_game.current_page == "two_player" {
                TwoPlayerGame(current_game: current_game)
                    .transition(.fade)
                    .background(.black)
            }
            
            if current_game.current_page == "one_player" {
                OnePlayerGame(current_game: current_game)
                    .transition(.fade)
                    .background(.black)
            }
            
            if current_game.blur_background == true {
                BackgroundRectangle(current_game: current_game)
                    .transition(.fade)
            }
            
            if current_game.showing_circle_menu == true {
                CircleMenu(current_game: current_game)
                    .transition(.zoomEffect)
                    .zIndex(0.4)
            }
            
            if ["four_player", "three_player", "two_player"].contains(current_game.current_page) {
                MenuButton(current_game: current_game)
                    .zIndex(0.5)
            }
            
            if current_game.showing_keypad == true {
                SetLifeKeypad(current_game: current_game)
                    .zIndex(/*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/)
                    .rotationEffect(Angle(degrees: current_game.current_rotation))
                    .transition(.zoomEffect)
            }
            
            if current_game.showing_player_menu == true {
                PlayerMenu(current_game: current_game)
                    .zIndex(/*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/)
                    .rotationEffect(Angle(degrees: current_game.caller.rotation))
                    .edgesIgnoringSafeArea(.all)
                    .frame(width: 10, height:10)
                    .transition(.zoomEffect)
            }
            
            if current_game.showing_confirm == true {
                Confirmation(current_game: current_game, confirm_text: "String")
                    .transition(.zoomEffect)
                    .zIndex(/*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/)
            }
        }
    }
}

#Preview {
    PageManager(current_game: ActiveGame(player_count: 4, starting_life: 40))
}
