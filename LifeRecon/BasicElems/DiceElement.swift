//
//  DiceElement.swift
//  LifeRecon
//
//  Created by Michael Stang on 11/19/24.
//

import SwiftUI

struct DiceElement: View {
    let icon: String
    let min_value: Int
    let max_value: Int
    let mode: Int
    @ObservedObject var current_game: ActiveGame
    @State private var value: Int = -1
    @State private var lastUpdated: Date? = nil
    @State private var resetWorkItem: DispatchWorkItem?
    
    // MODE 0 = NORMAL RANDOM
    // MODE 1 = COIN
    // MODE 2 = CHOOSE
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Button {
                    if mode != 2 {
                        dice_roll_haptics()
                        withAnimation {
                            value = Int.random(in: min_value..<max_value+1)
                        }
                        
                        resetWorkItem?.cancel()
                        let workItem = DispatchWorkItem {
                            withAnimation {
                                value = -1
                            }
                        }
                        resetWorkItem = workItem
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: workItem)
                    } else {
                        medium_haptic_pulse()
                        current_game.showing_random_dice_menu = true
                        current_game.blur_background = true
                    }
                    
                } label : {
                    if mode == 2 {
                        if current_game.random_choose_value == -1 {
                            Image(icon)
                                .resizable(resizingMode: .stretch)
                                .frame(width: geometry.size.height, height: geometry.size.height)
                                .transition(.zoomEffect)
                        } else {
                            Text(String(current_game.random_choose_value))
                                .foregroundStyle(.white)
                                .fontWeight(.bold)
                                .font(.system(size: geometry.size.height * 0.6))
                                .transition(.zoomEffect)
                        }
                    } else {
                        if value == -1 {
                            Image(icon)
                                .resizable(resizingMode: .stretch)
                                .frame(width: geometry.size.height, height: geometry.size.height)
                                .transition(.zoomEffect)
                        } else {
                            if mode == 0 {
                                Text(String(value))
                                    .foregroundStyle(.white)
                                    .fontWeight(.bold)
                                    .font(.system(size: geometry.size.height * 0.6))
                                    .transition(.zoomEffect)
                            } else if mode == 1 {
                                Text(value == 1 ? "H" : "T")
                                    .foregroundStyle(.white)
                                    .fontWeight(.bold)
                                    .font(.system(size: geometry.size.height * 0.6))
                                    .transition(.zoomEffect)
                            }
                        }
                    }
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
            .frame(width: 50, height: 50)
            
        }
    }
}

#Preview {
    DiceElement(icon: "Dice_D4", min_value: 1, max_value: 4, mode: 0, current_game: ActiveGame(player_count: 4, starting_life: 40))
}
