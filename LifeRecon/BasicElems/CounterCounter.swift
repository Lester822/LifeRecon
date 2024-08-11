//
//  CounterCounter.swift
//  LifeRecon
//
//  Created by Michael Stang on 8/10/24.
//

import SwiftUI

struct CounterCounter: View {
    var icon: String
    @Binding var number: Int
    
    var body: some View {
        ZStack (content: {
            VStack(spacing: 0.0) {
                Button {
                    soft_pulse()
                    number += 1
                } label: {
                    UnevenRoundedRectangle(cornerRadii: .init(
                        topLeading: 20.0,
                        bottomLeading: 00.0,
                        bottomTrailing: 00.0,
                        topTrailing: 20.0),
                        style: .continuous)
                    .padding(.all, 0.0)
                    .foregroundColor(number != 0 ? .white : .gray)
                    .frame(width: 70, height: 50)
                }
                
                Button {
                    soft_pulse()
                    number -= 1
                } label: {
                    UnevenRoundedRectangle(cornerRadii: .init(
                        topLeading: 00.0,
                        bottomLeading: 20.0,
                        bottomTrailing: 20.0,
                        topTrailing: 00.0),
                        style: .continuous)
                    .padding(.all, 0.0)
                    .foregroundColor(number != 0 ? .white : .gray)
                    .frame(width: 70, height: 50)
                }
            }
            
            VStack (content: {
                if icon != "NONE" {
                    if number == 0 {
                        Image(icon)
                            .resizable(resizingMode: .stretch)
                            .frame(width: 50, height: 50)
                            .allowsHitTesting(false)
                            
                        
                        Text(String(number))
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding(.top, -6.0)
                            .padding(.bottom, 5.0)
                            .allowsHitTesting(false)
                    } else {
                        Image(icon)
                            .resizable(resizingMode: .stretch)
                            .frame(width: 50, height: 50)
                            .allowsHitTesting(false)
                            .colorInvert()
                            
                        
                        Text(String(number))
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                            .padding(.top, -6.0)
                            .padding(.bottom, 5.0)
                            .allowsHitTesting(false)
                    }
                    
                    
                } else {
                    Text(String(number))
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.bottom, -3)
                        .allowsHitTesting(false)
                }
            })

        })
    }
}

#Preview {
    CounterCounter(icon: "UnknownIconIcon", number: .constant(10))
}
