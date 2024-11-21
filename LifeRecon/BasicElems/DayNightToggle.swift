//
//  ToggleCircle.swift
//  LifeRecon
//
//  Created by Michael Stang on 8/11/24.
//

import SwiftUI

struct DayNightToggle: View {
    @Binding var toggle: String
    @ObservedObject var current_game: ActiveGame
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                
                Button {
                    medium_haptic_pulse()
                    withAnimation {
                        if toggle == "day" {
                            toggle = "night"
                        } else {
                            toggle = "day"
                        }
                    }
                    
                } label: {
                    if toggle == "day" {
                        Circle()
                            .foregroundColor(day_yellow)
                    } else if toggle == "night" {
                        Circle()
                            .foregroundColor(night_blue)
                    } else {
                        Circle()
                            .foregroundColor(.black)
                    }
                    
                }
                .gesture(DragGesture().onEnded { gesture in
                    //let verticalMovement = gesture.translation.height
                    let horizontalMovement = gesture.translation.width
                    let verticalMovement = gesture.translation.height
                    if (horizontalMovement != 0 || verticalMovement != 0) {
                        withAnimation {
                            toggle = ""
                        }
                    }
                })
                
                
                VStack {
                    Image("DayNightIcon")
                        .resizable(resizingMode: .stretch)
                        .frame(width: geometry.size.height * 0.7, height: geometry.size.height * 0.7)
                        .allowsHitTesting(false)
                    Spacer()
                        .frame(height: geometry.size.height * 0.06)
                }
                
                
                VStack {
                    Spacer()
                        .frame(height: geometry.size.height * 0.65)
                    RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                        .frame(width: geometry.size.height * 0.2, height: geometry.size.height * 0.07)
                        .foregroundColor(.white)
                }
                
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
            .aspectRatio(1, contentMode: .fit)
            .padding(0.0)
            
            
        }
    }
}

#Preview {
    DayNightToggle(toggle: Binding.constant(""), current_game: ActiveGame(player_count: 40, starting_life: 4))
}
