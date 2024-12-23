import SwiftUI

struct ThreeActionButton: View {
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
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.blue)
                Text("Button")
                    .foregroundColor(.white)
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
        print("Tapped")
    }
    
    func onLongPress() -> Void {
        print("Long pressed")
    }
    
    func onSwipe() -> Void {
        print("Swiped")
    }
}

//ThreeActionButton(
//    onTap: {
//        print("Tapped immediately")
//    },
//    onLongPress: {
//        print("Long pressed")
//    },
//    onSwipe: {
//        print("Swiped")
//    }
//)
//.frame(width:100, height:50)

