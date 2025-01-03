//
//  KeypadKey.swift
//  LifeRecon
//
//  Created by Michael Stang on 4/10/24.
//

import SwiftUI

struct Key_HomeScreen: View {
    let given_text: String
    let color: Color
    let background: Color
    var body: some View {
        ZStack(content: {
//            RoundedRectangle(cornerRadius: 20)
//                .frame(width: 65, height: 40)
//                .foregroundColor(.black)
            RoundedRectangle(cornerRadius: 10)
                .frame(width: 230, height: 55)
                .foregroundColor(background)
            Text(given_text)
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(color)
        })
    }
}

#Preview {
    Key_HomeScreen(given_text: "Start Game", color: .black, background: Color(hue: 1.0, saturation: 0.0, brightness: 0.835))
}
