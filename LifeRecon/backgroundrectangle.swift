//
//  backgroundrectangle.swift
//  LifeRecon
//
//  Created by Michael Stang on 4/11/24.
//

import SwiftUI

struct BackgroundRectangle: View {
    @ObservedObject var current_game: ActiveGame
    var body: some View {
        Rectangle()
            .foregroundColor(.black)
            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
            .opacity(0.5)
            .onTapGesture {
                withAnimation {
                    self.current_game.showing_keypad = false
                    self.current_game.showing_circle_menu = false
                }
            }
    }
}

#Preview {
    BackgroundRectangle(current_game: ActiveGame(player_count: 4, starting_life: 40))
}
