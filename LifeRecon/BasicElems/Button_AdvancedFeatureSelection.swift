//
//  MenuSelector.swift
//  LifeRecon
//
//  Created by Michael Stang on 10/18/24.
//

import SwiftUI

struct Button_AdvancedFeatureSelection: View {
    @ObservedObject var current_game: ActiveGame
    var text: String
    var icon: String
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                RoundedRectangle(cornerRadius: geometry.size.width * 0.05)
                    .opacity(1)
                    .foregroundStyle(.orange)
                HStack {
                    Spacer()
                        .frame(width: geometry.size.width*0.05)
                    Image(icon)
                        .resizable(resizingMode: .stretch)
                        .aspectRatio(contentMode: .fit)
                        .padding(.vertical, geometry.size.height * 0.15)
                        .frame(height: geometry.size.height)
                    Text(text)
                        .font(.system(size: geometry.size.height * 0.26))
                        .fontWeight(.bold)
                        .foregroundStyle(.white)
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                    Spacer()
                        .frame(width: geometry.size.width*0.05)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
            }
            .aspectRatio(4, contentMode: .fit)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
        }
    }
}

#Preview {
    Button_AdvancedFeatureSelection(current_game: ActiveGame(player_count: 4, starting_life: 40), text: "Commander Menu That Takes Two", icon: "DungeonIcon")
        .padding(10)
        .frame(width: UIScreen.main.bounds.width, height:UIScreen.main.bounds.width/4)
}
