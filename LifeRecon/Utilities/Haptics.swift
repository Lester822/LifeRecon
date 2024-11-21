//
//  Haptics.swift
//  LifeRecon
//
//  Created by Michael Stang on 11/19/24.
//

import Foundation
import SwiftUI

func haptic_pulse() {
    let generator = UIImpactFeedbackGenerator(style: .medium)
    generator.prepare()
    generator.impactOccurred()
}

func soft_pulse() {
    let generator = UIImpactFeedbackGenerator(style: .soft)
    generator.prepare()
    generator.impactOccurred()
}
