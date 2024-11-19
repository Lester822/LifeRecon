//
//  DiceElement.swift
//  LifeRecon
//
//  Created by Michael Stang on 11/19/24.
//

import SwiftUI

struct DiceElement: View {
    let icon: String
    let min_value: Int
    let max_value: Int
    @State private var value: Int = -1
    @State private var lastUpdated: Date? = nil
    @State private var resetWorkItem: DispatchWorkItem?
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Button {
                    withAnimation {
                        value = Int.random(in: min_value..<max_value+1)
                    }
                    
                    resetWorkItem?.cancel()
                    let workItem = DispatchWorkItem {
                        withAnimation(.easeOut(duration: 0.2)) {
                            withAnimation {
                                value = -1
                            }
                        }
                    }
                    resetWorkItem = workItem
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: workItem)
                } label : {
                    if value == -1 {
                        Image(icon)
                            .resizable(resizingMode: .stretch)
                            .frame(width: geometry.size.height, height: geometry.size.height)
                    } else {
                        Text(String(value))
                            .foregroundStyle(.white)
                            .fontWeight(.bold)
                            .font(.system(size: geometry.size.height * 0.6))
                    }
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
            .frame(width: 50, height: 50)
            
        }
    }
}

#Preview {
    DiceElement(icon: "Dice_D4", min_value: 1, max_value: 4)
}
