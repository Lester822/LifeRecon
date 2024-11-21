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

struct OpacityButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .opacity(configuration.isPressed ? 0.6 : 0.00001)
            .animation(.easeInOut(duration: 0.4), value: configuration.isPressed)
    }
}
