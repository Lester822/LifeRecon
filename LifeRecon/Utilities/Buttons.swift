//
//  File.swift
//  LifeRecon
//
//  Created by Michael Stang on 11/13/24.
//

import Foundation
import SwiftUI

struct NoClickButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .opacity(configuration.isPressed ? 1 : 1)
    }
}

struct MenuButtonType: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 1.05 : 1)
            .rotationEffect(configuration.isPressed ? Angle(degrees: 10) : Angle(degrees: 0))
    }
}

struct OpacityButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .opacity(configuration.isPressed ? 0.6 : 0.00001)
            .animation(.easeInOut(duration: 0.4), value: configuration.isPressed)
    }
}

//    Button(action: {
//        if !isHolding {
//            // Action for a simple click
//            print("Button clicked")
//        }
//    }) {
//        Text("Click or Hold")
//            .padding()
//            .background(Color.blue)
//            .foregroundColor(.white)
//            .cornerRadius(10)
//    }
//    .simultaneousGesture(
//        LongPressGesture(minimumDuration: 0.5) // Adjust duration as needed
//            .onEnded { _ in
//                isHolding = true
//                // Action for a long hold
//                print("Button held")
//                // Reset the holding state shortly after
//                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
//                    isHolding = false
//                }
//            }
//    )
