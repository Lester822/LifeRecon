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
                current_game.showing_circle_menu.toggle()
//                current_game.blur_background.toggle()
            }
            haptic_pulse()
            
        } label: {
            Image("MenuIcon")
                .resizable(resizingMode: .stretch)
                .aspectRatio(contentMode: .fit)
                .frame(width: 100.0, height: 100.0)
                .foregroundStyle(.tint)
        }
    }
}

#Preview {
    MenuButton(current_game: ActiveGame(player_count: 40, starting_life: 4))
}
