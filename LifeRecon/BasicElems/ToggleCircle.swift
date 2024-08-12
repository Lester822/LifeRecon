//
//  ToggleCircle.swift
//  LifeRecon
//
//  Created by Michael Stang on 8/11/24.
//

import SwiftUI

struct ToggleCircle: View {
    @Binding var toggle: Bool
    var icon: String
    @ObservedObject var current_game: ActiveGame
    
    var body: some View {
        ZStack {
            
            Button {
                haptic_pulse()
                withAnimation {
                    toggle.toggle()
                }
                
            } label: {
                if toggle == true {
                    Circle()
                        .frame(width: 50.0, height: 50.0)
                        .foregroundColor(.orange)
                } else {
                    Circle()
                        .frame(width: 50.0, height: 50.0)
                        .foregroundColor(.black)
                }
                
            }
            
            VStack {
                Image(icon)
                    .resizable(resizingMode: .stretch)
                    .frame(width: 35.0, height: 35.0)
                    .allowsHitTesting(false)
                Spacer()
                    .frame(height: 3.0)
            }
            
            
            VStack {
                Spacer()
                    .frame(height: 35.0)
                RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                    .frame(width: 10.0, height: 5.0)
                    .foregroundColor(.white)
            }
            
            
        }
        
    }
}

#Preview {
    ToggleCircle(toggle: Binding.constant(true), icon: "UnknownIconIcon", current_game: ActiveGame(player_count: 40, starting_life: 4))
}
