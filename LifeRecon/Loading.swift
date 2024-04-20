//
//  Loading.swift
//  LifeRecon
//
//  Created by Michael Stang on 4/9/24.
//

import SwiftUI
import UIKit


struct Loading: View {
    @ObservedObject var current_game: ActiveGame
    
    var body: some View {
        VStack (content: {
            Image("LifeReconLong")
                .resizable(resizingMode: .stretch)
                .frame(width: 140*1.75, height: 52.4*1.75)
            HStack {
                Text("by")
                    .font(.headline)
                    .multilineTextAlignment(.center)
                Spacer()
                    .frame(width: 10.0)
                Image("ReconLogo")
                    .resizable(resizingMode: .stretch)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100.0, height: 100.0)
                    .foregroundStyle(.tint)
            }
            Button {
                haptic_pulse()
                withAnimation {
                    current_game.current_page = "settings"
                }
            } label: {
                LargeKey(given_text: "Start", color: .white, background: .red)
            }
            .frame(width: 140.0, height: 55.0)
        })
    }
}


#Preview {
    Loading(current_game: ActiveGame(player_count: 4, starting_life: 40))
}
