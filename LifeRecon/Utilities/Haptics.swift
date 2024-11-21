//
//  Haptics.swift
//  LifeRecon
//
//  Created by Michael Stang on 11/19/24.
//

import Foundation
import SwiftUI

func heavy_haptic_pulse() {
    let generator = UIImpactFeedbackGenerator(style: .heavy)
    generator.prepare()
    generator.impactOccurred()
}

func medium_haptic_pulse() {
    let generator = UIImpactFeedbackGenerator(style: .medium)
    generator.prepare()
    generator.impactOccurred()
}

func light_haptic_pulse() {
    let generator = UIImpactFeedbackGenerator(style: .light)
    generator.prepare()
    generator.impactOccurred()
}

func soft_haptic_pulse() {
    let generator = UIImpactFeedbackGenerator(style: .soft)
    generator.prepare()
    generator.impactOccurred()
}

func rigid_haptic_pulse() {
    let generator = UIImpactFeedbackGenerator(style: .rigid)
    generator.prepare()
    generator.impactOccurred()
}

func dice_roll_haptics() {
    let generator = UIImpactFeedbackGenerator(style: .rigid)
    generator.prepare()
    generator.impactOccurred()
    DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
        generator.prepare()
        generator.impactOccurred()
        // Put your code which should be executed with a delay here
    }
    
}
