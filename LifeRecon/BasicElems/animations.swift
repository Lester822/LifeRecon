//
//  animations.swift
//  LifeRecon
//
//  Created by Michael Stang on 4/11/24.
//

import Foundation
import SwiftUI

extension AnyTransition {
    static var zoomIt: AnyTransition {
        .asymmetric(
            insertion: .scale.combined(with: .opacity),
            removal: AnyTransition.scale(scale: 0.0)
        )
    }
    static var fade: AnyTransition {
        .asymmetric(
            insertion: .opacity,
            removal: .opacity
        )
    }
    static var zoomEffect: AnyTransition {
        .asymmetric(
            insertion: AnyTransition.scale(scale: 0.1, anchor: .center)
                .combined(with: .opacity)
                .animation(.easeInOut(duration: 0.3)),
            removal: AnyTransition.scale(scale: 0.1, anchor: .center)
                .combined(with: .opacity)
                .animation(.easeInOut(duration: 0.3))
        )
    }
}

func soft_pulse() {
    let generator = UIImpactFeedbackGenerator(style: .soft)
    generator.prepare()
    generator.impactOccurred()
}
