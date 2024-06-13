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
            removal: .scale
        )
    }
    static var fade: AnyTransition {
        .asymmetric(
            insertion: .opacity,
            removal: .opacity
        )
    }
}
