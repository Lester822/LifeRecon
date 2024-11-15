//
//  DungeonBackground.swift
//  LifeRecon
//
//  Created by Michael Stang on 10/1/24.
//

import SwiftUI

struct DungeonBackground: View {
    @ObservedObject var current_game: ActiveGame
    
    var body: some View {
        GeometryReader { geometry in
            // Determine the maximum dimension to cover the screen when rotated
            let maxDimension = max(geometry.size.width, geometry.size.height)
            
            Image("DungeonWall")
                .resizable()
                .scaledToFill()
                .scaleEffect(1.2)
            // Set the frame to the maximum dimension
                .frame(width: maxDimension, height: maxDimension, alignment: .center)
            // Rotate the image before positioning
                .rotationEffect(
                    current_game.caller.rotation == 0 || current_game.caller.rotation == 180
                    ? Angle(degrees: 180)
                    : Angle(degrees: 90),
                    anchor: .center
                )
            // Center the image within the GeometryReader
//                .position(x: geometry.size.width / 2, y: geometry.size.height / 2)
                .brightness(-0.5)
                .blur(radius: 5.0)
                .onTapGesture {
                    withAnimation {
                        current_game.showing_ring = false
                        current_game.showing_dungeon = false
                        
                    }
                }
                .clipped()
        }
        // Extend the view to ignore safe area insets
        .edgesIgnoringSafeArea(.all)
        .allowsHitTesting(current_game.showing_dungeon || current_game.showing_ring)
    }
    
}

#Preview {
    DungeonBackground(current_game: ActiveGame(player_count: 4, starting_life: 40))
}
