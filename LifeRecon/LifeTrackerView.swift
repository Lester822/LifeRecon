//
//  LifeTrackerView.swift
//  LifeRecon
//
//  Created by Michael Stang on 4/9/24.
//

import SwiftUI

struct LifeTrackerView: View {
    var body: some View {
        ZStack(content: {
            VStack (alignment: .center, spacing: 0.0, content: {
                HStack (spacing: 0.0, content: {
                    LifeBlock(block_color: .blue, starting_life: 40)
                    LifeBlock(block_color: .red, starting_life: 40)
                        .rotationEffect(Angle(degrees: 180))
                })
       
                HStack (spacing: 0.0, content: {
                    LifeBlock(block_color: .green, starting_life: 40)
                    LifeBlock(block_color: .yellow, starting_life: 40)
                        .rotationEffect(Angle(degrees: 180))
                    
                })
            })
            .padding(-10)
            Image("MenuIcon")
                .resizable(resizingMode: .stretch)
                .aspectRatio(contentMode: .fit)
                .frame(width: 100.0, height: 100.0)
                .foregroundStyle(.tint)
                .rotationEffect(Angle(degrees: 90))
        })

    }
}

#Preview {
    LifeTrackerView()
}
