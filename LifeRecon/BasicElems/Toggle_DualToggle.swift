//
//  Toggle_DualToggle.swift
//  LifeRecon
//
//  Created by Michael Stang on 12/31/24.
//

import SwiftUI

struct Toggle_DualToggle: View {
    var text_for_true: String
    var text_for_false : String
    @Binding var toggle: Bool
    @ObservedObject var current_game: ActiveGame
    @ObservedObject var player: Player

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                RoundedRectangle(cornerRadius: geometry.size.width * 1)
                    .foregroundStyle(.white)
                    
                HStack {
                    ZStack {
                        Button {
                            medium_haptic_pulse()
                            withAnimation {
                                toggle = true
                            }
                        } label : {
                            if toggle {
                                RoundedRectangle(cornerRadius: geometry.size.width * 1)
                                    .padding(.trailing, -10.0)
                                    .padding(0.0)
                                    .foregroundStyle(.red)
                                    .transition(.zoomEffect)
                            } else {
                                RoundedRectangle(cornerRadius: geometry.size.width * 1)
                                    .padding(0.0)
                                    .foregroundStyle(.black)
                                    .opacity(0.01)
                                    .transition(.zoomEffect)
                            }
                        }
                        .transition(.zoomEffect)
                        Text(text_for_true)
                            .fontWeight(.bold)
                            .padding(.leading, 5.0)
                            .foregroundStyle(toggle ? .white : .black)
                            .allowsHitTesting(false)
                    }
                    Spacer()
                    ZStack {
                        Button {
                            medium_haptic_pulse()
                            withAnimation {
                                toggle = false
                            }
                        } label : {
                            if !toggle {
                                RoundedRectangle(cornerRadius: geometry.size.width * 1)
                                    .padding(.leading, -10.0)
                                    .padding(0.0)
                                    .foregroundStyle(.red)
                                    .transition(.zoomEffect)
                            } else {
                                RoundedRectangle(cornerRadius: geometry.size.width * 1)
                                    .padding(0.0)
                                    .foregroundStyle(.black)
                                    .opacity(0.01)
                                    .transition(.zoomEffect)
                            }
                        }
                        
                        Text(text_for_false)
                            .fontWeight(.bold)
                            .padding(.trailing, 5.0)
                            .foregroundStyle(toggle ? .black : .white)
                            .allowsHitTesting(false)
                    }
                }
            }
            .overlay(
                RoundedRectangle(cornerRadius: geometry.size.width * 1)
                    .stroke(Color.red, lineWidth: 5)
            )
            .aspectRatio(4.6, contentMode: .fit)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
        }
    }
}

#Preview {
    var toggle = true
    Toggle_DualToggle(text_for_true: "Option 1", text_for_false: "Option 2", toggle: .constant(true), current_game: ActiveGame(player_count: 4, starting_life: 40), player: Player(life_total: 40, name: "Example"))
        .frame(height: UIScreen.main.bounds.height * 0.1)
}
