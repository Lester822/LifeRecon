//
//  SwiftUIView.swift
//  LifeRecon
//
//  Created by Michael Stang on 11/13/24.
//

import SwiftUI

struct Toggle_Checkbox: View {
    @Binding var toggle: Bool
    @ObservedObject var current_game: ActiveGame
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                
                Button {
                    medium_haptic_pulse()
                    withAnimation {
                        toggle.toggle()
                    }
                    
                } label: {
                    RoundedRectangle(cornerRadius: geometry.size.width*0.15)
                        .foregroundColor(.black)
                        .aspectRatio(1, contentMode: .fill)
                }
                
                if toggle {
                    VStack {
                        Image("GreenCheckmark")
                            .resizable(resizingMode: .stretch)
                            .frame(width: geometry.size.height * 0.7, height: geometry.size.height * 0.7)
                            .allowsHitTesting(false)
                    }
                }
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
            .aspectRatio(1, contentMode: .fit)
            .padding(0.0)
            
            
        }
    }
}

#Preview {
    Toggle_Checkbox(toggle: Binding.constant(true), current_game: ActiveGame(player_count: 40, starting_life: 4))
}
