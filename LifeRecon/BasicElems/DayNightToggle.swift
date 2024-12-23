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
//    let onTap: () -> Void
//    let onLongPress: () -> Void
//    let onSwipe: () -> Void
    
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
                GeometryReader { geometry in
                    ZStack {
                        
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
        medium_haptic_pulse()
        withAnimation {
            if toggle == "day" {
                toggle = "night"
            } else {
                toggle = "day"
            }
        }
    }
    
    func onLongPress() -> Void {
        withAnimation {
            if toggle == "day" || toggle == "night" {
                heavy_haptic_pulse()
            }
            toggle = ""
        }
    }
    
    func onSwipe() -> Void {
        print("Swiped")
    }
}

#Preview {
    DayNightToggle(toggle: Binding.constant(""), current_game: ActiveGame(player_count: 40, starting_life: 4))
}
