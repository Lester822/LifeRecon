//
//  MenuButton.swift
//  LifeRecon
//
//  Created by Michael Stang on 8/10/24.
//

import SwiftUI
struct MenuButton: View {
    @ObservedObject var current_game: ActiveGame
    
    // Configuration
    private let longPressDuration: TimeInterval = 0.5
    private let swipeThreshold: CGFloat = 30.0
    
    @State private var isPressing = false
    @State private var longPressTriggered = false
    @State private var hasMoved = false
    @State private var initialPosition: CGPoint?
    @State private var longPressTask: Task<Void, Never>?
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                if current_game.day_night == "day" {
                    Image("Icon_Day")
                        .resizable(resizingMode: .stretch)
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 100.0, height: 100.0)
                        .foregroundStyle(.tint)
                        .shadow(color: day_yellow, radius: 20)

                } else if (current_game.day_night) == "night" {
                    Image("Icon_Night")
                        .resizable(resizingMode: .stretch)
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 100.0, height: 100.0)
                        .foregroundStyle(.tint)
                        .shadow(color: night_blue, radius: 20)
                } else {
                    Image("MenuIcon")
                        .resizable(resizingMode: .stretch)
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 100.0, height: 100.0)
                        .foregroundStyle(.tint)
                        
                }
            }
            .frame(width: geometry.size.width, height: geometry.size.height)
            .scaleEffect(isPressing ? 0.95 : 1.0)   // Scale down when pressing
            .animation(.easeInOut(duration: 0.1), value: isPressing) // Animate the scale change
            .contentShape(Rectangle())
            .gesture(
                DragGesture(minimumDistance: 0)
                    .onChanged { value in
                        if !isPressing {
                            // Finger just went down
                            isPressing = true
                            hasMoved = false
                            longPressTriggered = false
                            initialPosition = value.startLocation
                            
                            // Start the long press timer
                            longPressTask = Task {
                                try? await Task.sleep(nanoseconds: UInt64(longPressDuration * 1_000_000_000))
                                if isPressing && !hasMoved && !longPressTriggered {
                                    // Trigger long press
                                    longPressTriggered = true
                                    onLongPress()
                                }
                            }
                        } else {
                            // Finger is moving
                            let dx = value.translation.width
                            let dy = value.translation.height
                            if abs(dx) > swipeThreshold || abs(dy) > swipeThreshold {
                                // Consider this a swipe
                                hasMoved = true
                                // If we moved, we should cancel the long press action
                                longPressTask?.cancel()
                            }
                        }
                    }
                    .onEnded { value in
                        // Finger lifted
                        if isPressing {
                            isPressing = false
                            longPressTask?.cancel()
                            
                            if longPressTriggered {
                                // Already triggered long press, do nothing else
                            } else if hasMoved {
                                // User swiped
                                onSwipe()
                            } else {
                                // No long press or swipe, this is a tap
                                onTap()
                            }
                        }
                    }
            )
        }
    }
    func onTap() -> Void {
        withAnimation {
            if current_game.showing_dice_tray || current_game.showing_confirm {
                current_game.showing_dice_tray = false
                current_game.showing_confirm = false
                current_game.showing_circle_menu = true
            } else {
                current_game.showing_circle_menu.toggle()
            }
        }
        medium_haptic_pulse()
    }
    
    func onSwipe() -> Void {
        withAnimation {
            if current_game.day_night == "day" {
                current_game.day_night = "night"
            } else if current_game.day_night == "night" {
                current_game.day_night = "day"
            }
        }
    }
    
    func onLongPress() -> Void {
        withAnimation {
            current_game.day_night = ""
        }
    }
}


#Preview {
    MenuButton(current_game: ActiveGame(player_count: 40, starting_life: 4))
}
