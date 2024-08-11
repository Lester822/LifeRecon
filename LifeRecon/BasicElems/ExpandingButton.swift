//
//  DiceTray.swift
//  LifeRecon
//
//  Created by Michael Stang on 7/28/24.
//

import SwiftUI

struct ExpandingButton: View {
    @ObservedObject var current_game: ActiveGame
    @State var mode = "circle"
    
    public var item_color: Color
    var body: some View {
        GeometryReader { geometry in
            
            Button {
                if mode == "circle" {
                    mode = "rectangle"
                } else {
                    mode = "circle"
                }
            } label: {
                if mode == "circle" {
                    ZStack {  // Circle Button
                        Circle()
                            .foregroundColor(item_color)
                            .frame(width: geometry.size.width/2, height: geometry.size.width/2)
                        
                        Image("UnknownIconIcon")
                            .resizable(resizingMode: .stretch)
                            .frame(width: geometry.size.width/2, height: geometry.size.width/2)
                    } // End Circle Button
                } else {
                    ZStack {
                        RoundedRectangle(cornerRadius: geometry.size.width/6)
                        .frame(width: geometry.size.width/2, height: geometry.size.width * (3/4))
                        .foregroundColor(item_color)
                        
                        VStack {
                            Image("UnknownIconIcon")
                                .resizable(resizingMode: .stretch)
                                .frame(width: geometry.size.width/2, height: geometry.size.width/2)
                            Text("1")
                                .font(.title)
                                .foregroundColor(.white)
                                .multilineTextAlignment(.center)
                                .padding(0.0)
                                .scaleEffect(CGSize(width: 2.0, height: 2.0))
                                .bold()
                            
                            Spacer()
                                .frame(height: geometry.size.height/20)
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    ExpandingButton(current_game: ActiveGame(player_count: 4, starting_life: 40), item_color: .red)
}
