//
//  KeypadKey.swift
//  LifeRecon
//
//  Created by Michael Stang on 4/10/24.
//

import SwiftUI

struct SmallKey: View {
    let given_text: String
    let color: Color
    let background: Color
    var body: some View {
        ZStack(content: {
//            RoundedRectangle(cornerRadius: 20)
//                .frame(width: 65, height: 40)
//                .foregroundColor(.black)
            RoundedRectangle(cornerRadius: 15)
                .frame(width: 35, height: 35)
                .foregroundColor(background)
            Text(given_text)
                .font(.title3)
                .fontWeight(.bold)
                .foregroundColor(color)
        })
    }
}

#Preview {
    SmallKey(given_text: "1", color: .black, background: Color(hue: 1.0, saturation: 0.0, brightness: 0.835))
}
