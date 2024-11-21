import SwiftUI
import UIKit

// USED IN LIFEBLOCKS

struct OpacityButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .opacity(configuration.isPressed ? 0.6 : 0.00001)
            .animation(.easeInOut(duration: 0.4), value: configuration.isPressed)
    }
}
