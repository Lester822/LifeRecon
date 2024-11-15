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
