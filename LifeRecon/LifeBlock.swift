//
//  LifeBlock.swift
//  LifeRecon
//
//  Created by Michael Stang on 4/9/24.
//

import SwiftUI

struct LifeBlock: View {
    var block_color: Color
    var starting_life: Int
    var body: some View {
        ZStack (content: {
            
            RoundedRectangle(cornerRadius: 3)
                .padding(.all, 0.0)
                .foregroundColor(block_color)
            Text(String(starting_life))
                .font(.system(size: 80))
                .fontWeight(.bold)
                .foregroundColor(Color.white)
                .padding(.horizontal)
                .rotationEffect(Angle(degrees: 90))
                
        })
    }
}

#Preview {
    LifeBlock(block_color: .red, starting_life: 40)
}
