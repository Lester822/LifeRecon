//
//  ToggleCircle.swift
//  LifeRecon
//
//  Created by Michael Stang on 8/11/24.
//

import SwiftUI

struct Toggle_Circle: View {
    @Binding var toggle: Bool
    var icon: String
    @ObservedObject var current_game: ActiveGame
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                
                Button {
                    haptic_pulse()
                    withAnimation {
                        toggle.toggle()
                    }
                    
                } label: {
                    if toggle == true {
                        Circle()
                            .foregroundColor(.orange)
                    } else {
                        Circle()
                            .foregroundColor(.black)
                    }
                    
                }
                
                VStack {
                    Image(icon)
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
    Toggle_Circle(toggle: Binding.constant(true), icon: "UnknownIconIcon", current_game: ActiveGame(player_count: 40, starting_life: 4))
}
