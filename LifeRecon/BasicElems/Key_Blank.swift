//
//  BlankKey.swift
//  LifeRecon
//
//  Created by Michael Stang on 4/18/24.
//

import SwiftUI

struct Key_Blank: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 15)
            .frame(width: 60, height: 35)
            .opacity(0)
    }
}

#Preview {
    Key_Blank()
}
