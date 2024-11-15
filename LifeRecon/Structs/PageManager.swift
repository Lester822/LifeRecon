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
            
            if current_game.current_page == "five_player" {
                FivePlayerGame(current_game: current_game)
                    .transition(.fade)
                    .background(.black)
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
            
            if ["four_player", "three_player", "two_player"].contains(current_game.current_page) {
                MenuButton(current_game: current_game)
                    .zIndex(0.5)
            }
            
            if ["four_player", "three_player", "two_player"].contains(current_game.current_page) && current_game.showing_commander_damage {
                CommanderToggleButton(current_game: current_game, player: current_game.caller)
                    .zIndex(0.51)
            }
            
            if current_game.showing_keypad == true {
                SetLifeKeypad(current_game: current_game)
                    .zIndex(/*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/)
                    .rotationEffect(Angle(degrees: current_game.current_rotation))
                    .transition(.zoomEffect)
            }
            
            if current_game.showing_player_menu == true {
                PlayMenuSwitcher(current_game: current_game)
                    .zIndex(/*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/)
                    .rotationEffect(Angle(degrees: current_game.caller.rotation))
                    .edgesIgnoringSafeArea(.all)
                    .frame(width: 10, height:10)
                    .transition(.zoomEffect)
            }
            
            if current_game.showing_dungeon || current_game.showing_ring {
                DungeonBackground(current_game: current_game)
                    .allowsHitTesting(current_game.showing_dungeon || current_game.showing_ring)
                    .zIndex(1.1)
                    .transition(.fade)
            }
            
            if current_game.showing_ring == true {
                RingTrack(current_game: current_game, caller: current_game.caller)
                    .zIndex(1.2)
                    .edgesIgnoringSafeArea(.all)
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                    .rotationEffect(Angle(degrees: current_game.caller.rotation))
                    .transition(.zoomEffect)
            }

            if current_game.showing_dungeon == true {
                DungeonDelverSwitcher(current_game: current_game, caller: current_game.caller)
                    .zIndex(1.2)
                    .edgesIgnoringSafeArea(.all)
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                    .rotationEffect(Angle(degrees: current_game.caller.rotation))
                    .transition(.zoomEffect)
            }
            
            if current_game.showing_confirm == true {
                Confirmation(current_game: current_game, confirm_text: "String")
                    .transition(.zoomEffect)
                    .zIndex(1.0)
            }
        }
    }
}

#Preview {
    PageManager(current_game: ActiveGame(player_count: 4, starting_life: 40))
}
