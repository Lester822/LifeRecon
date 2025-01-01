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
                .gesture(
                    DragGesture().onEnded { gesture in
                            
                        let horizontalMovement = gesture.translation.width
                        let verticalMovement = gesture.translation.height
                        
                        let angleInRadians = atan2(verticalMovement, horizontalMovement)
                        var angleInDegrees = angleInRadians * 180 / .pi  // convert to degrees
                        
                        print("Radians: \(angleInRadians), Degrees: \(angleInDegrees)")
                        
                        
                        if ROTATE_SNAP == true {
                            // 1) Snap angleInDegrees to nearest multiple of 90
                            // Use “toNearestOrAwayFromZero” if you want the conventional "round halves up" style:
                            angleInDegrees = (angleInDegrees / 90.0).rounded(.toNearestOrAwayFromZero) * 90.0

                            // 2) Wrap to [-180, 180]
                            if angleInDegrees - current_game.temporary_rotate > 180 {
                                angleInDegrees -= 360
                            } else if angleInDegrees - current_game.temporary_rotate < -180 {
                                angleInDegrees += 360
                            }
                        }
                        
                        withAnimation {
                            current_game.temporary_rotate_applied = true
                            current_game.temporary_rotate = angleInDegrees
                        }
                    }
                )
            
        }
        // Extend the view to ignore safe area insets
        .edgesIgnoringSafeArea(.all)
        .allowsHitTesting(current_game.showing_dungeon || current_game.showing_ring)
    }
    
}

#Preview {
    DungeonBackground(current_game: ActiveGame(player_count: 4, starting_life: 40))
}
