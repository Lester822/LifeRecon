//
//  KeypadKey.swift
//  LifeRecon
//
//  Created by Michael Stang on 4/10/24.
//

import SwiftUI

struct HomeScreenKey: View {
    let given_text: String
    let color: Color
    let background: Color
    var body: some View {
        ZStack(content: {
//            RoundedRectangle(cornerRadius: 20)
//                .frame(width: 65, height: 40)
//                .foregroundColor(.black)
            RoundedRectangle(cornerRadius: 50)
                .frame(width: 300, height: 100)
                .foregroundColor(background)
            Text(given_text)
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(color)
        })
    }
}

#Preview {
    HomeScreenKey(given_text: "Start Game", color: .black, background: Color(hue: 1.0, saturation: 0.0, brightness: 0.835))
}
