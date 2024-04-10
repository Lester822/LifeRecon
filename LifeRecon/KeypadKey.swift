//
//  KeypadKey.swift
//  LifeRecon
//
//  Created by Michael Stang on 4/10/24.
//

import SwiftUI

struct KeypadKey: View {
    let given_text: String
    var body: some View {
        ZStack(content: {
            RoundedRectangle(cornerRadius: 20)
                .frame(width: 85, height: 55)
                .foregroundColor(.black)
            RoundedRectangle(cornerRadius: 20)
                .frame(width: 80, height: 50)
                .foregroundColor(.white)
            Text(given_text)
                .font(.largeTitle)
                .fontWeight(.bold)
        })
    }
}

#Preview {
    KeypadKey(given_text: "1")
}
