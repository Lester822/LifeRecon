//
//  SquareButton.swift
//  LifeRecon
//
//  Created by Michael Stang on 4/11/24.
//

import SwiftUI

struct SquareButton: View {
    var button_color: Color
    var text_color: Color
    var title: String
    var icon: String
    
    var body: some View {
        ZStack (content: {
            RoundedRectangle(cornerRadius:30)
                .frame(width: 100.0, height: 100.0)
                .foregroundColor(button_color)
                .opacity(/*@START_MENU_TOKEN@*/0.8/*@END_MENU_TOKEN@*/)
            VStack (content: {
                if icon != "NONE" {
                    Text(title)
                        .fontWeight(.bold)
                        .foregroundColor(text_color)
                        .padding(.bottom, -3)
                    Image(icon)
                        .resizable(resizingMode: .stretch)
                        .frame(width: 55, height: 55)
                
                } else {
                    Text(title)
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(text_color)
                        .padding(.bottom, -3)
                }
            })

        })

    }
}

#Preview {
    SquareButton(button_color:.black, text_color: .white, title: "Title", icon: "UnknownIconIcon")
}
