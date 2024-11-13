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
        GeometryReader { geometry in
            
            ZStack (content: {
                VStack(spacing: 0.0) {
                    Button {
                        soft_pulse()
                        withAnimation {
                            number += 1
                        }
                    } label: {
                        UnevenRoundedRectangle(cornerRadii: .init(
                            topLeading: min(geometry.size.height * 0.2, 40),
                            bottomLeading: 00.0,
                            bottomTrailing: 00.0,
                            topTrailing: min(geometry.size.height * 0.2, 40)),
                                               style: .continuous)
                        .padding(.all, 0.0)
                        .foregroundColor(number != 0 ? .white : .gray)
                    }
                    
                    Button {
                        soft_pulse()
                        withAnimation {
                            number -= 1
                        }
                        
                    } label: {
                        UnevenRoundedRectangle(cornerRadii: .init(
                            topLeading: 00.0,
                            bottomLeading: min(geometry.size.height * 0.2, 40),
                            bottomTrailing: min(geometry.size.height * 0.2, 40),
                            topTrailing: 00.0),
                                               style: .continuous)
                        .padding(.all, 0.0)
                        .foregroundColor(number != 0 ? .white : .gray)
                    }
                }
                .aspectRatio(7/10, contentMode: .fit)
                
                VStack (content: {
                    if icon != "NONE" {
                        if number == 0 {
                            Image(icon)
                                .resizable(resizingMode: .stretch)
                                .frame(width: geometry.size.height * 0.4857, height: geometry.size.height * 0.4857)
                                .padding(.top, geometry.size.height * 0.1)
                                .allowsHitTesting(false)
                            
                            
                            Text(String(number))
                                .font(.system(size: geometry.size.height * 0.3))
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .padding(.top, geometry.size.height * -0.13)
                                .padding(.bottom, geometry.size.height * 0.05)
                                .allowsHitTesting(false)
                                .scaledToFit()
                            
                        } else {
                            Image(icon)
                                .resizable(resizingMode: .stretch)
                                .frame(width: geometry.size.height * 0.4857, height: geometry.size.height * 0.4857)
                                .allowsHitTesting(false)
                                .padding(.top, geometry.size.height * 0.05)
                                .colorInvert()
                            
                            
                            Text(String(number))
                                .font(.system(size: geometry.size.height * 0.3))
                                .fontWeight(.bold)
                                .foregroundColor(.black)
                                .padding(.top, geometry.size.height * -0.13)
                                .padding(.bottom, geometry.size.height * 0.05)
                                .scaledToFit()
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
            .frame(alignment: .center)
        }
    }
}

#Preview {
    CounterCounter(icon: "UnknownIconIcon", number: .constant(0))
}
