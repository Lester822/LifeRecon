//
//  MenuButton.swift
//  LifeRecon
//
//  Created by Michael Stang on 8/10/24.
//

import SwiftUI

struct MenuButton: View {
    @ObservedObject var current_game: ActiveGame
    
    var body: some View {
        Button {
            withAnimation {
                if current_game.showing_dice_tray {
                    current_game.showing_dice_tray = false
                    current_game.showing_circle_menu = true
                } else {
                    current_game.showing_circle_menu.toggle()
                }
            }
            medium_haptic_pulse()
            
        } label: {
            if current_game.day_night == "day" {
                Image("Icon_Day")
                    .resizable(resizingMode: .stretch)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100.0, height: 100.0)
                    .foregroundStyle(.tint)
                    .gesture(DragGesture().onEnded { gesture in
                        //let verticalMovement = gesture.translation.height
                        let horizontalMovement = gesture.translation.width
                        let verticalMovement = gesture.translation.height
                        if (horizontalMovement != 0 || verticalMovement != 0 ) {
                            withAnimation {
                                current_game.day_night = "night"
                            }
                        }
                    })
                    .shadow(color: day_yellow, radius: 20)

            } else if (current_game.day_night) == "night" {
                Image("Icon_Night")
                    .resizable(resizingMode: .stretch)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100.0, height: 100.0)
                    .foregroundStyle(.tint)
                    .gesture(DragGesture().onEnded { gesture in
                        //let verticalMovement = gesture.translation.height
                        let horizontalMovement = gesture.translation.width
                        let verticalMovement = gesture.translation.height
                        if (horizontalMovement != 0 || verticalMovement != 0 ) {
                            withAnimation {
                                current_game.day_night = "day"
                            }
                        }
                    })
                    .shadow(color: night_blue, radius: 20)
            } else {
                Image("MenuIcon")
                    .resizable(resizingMode: .stretch)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100.0, height: 100.0)
                    .foregroundStyle(.tint)
            }
        }
    }
}

#Preview {
    MenuButton(current_game: ActiveGame(player_count: 40, starting_life: 4))
}
