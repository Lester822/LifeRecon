//
//  RingTrack.swift
//  LifeRecon
//
//  Created by Michael Stang on 11/13/24.
//

import SwiftUI

struct RingTrack: View {
    @ObservedObject var current_game: ActiveGame
    @ObservedObject var caller: Player
    
    var body: some View {
        VStack{
//            Text("The Ring Tracker")
//                .font(.largeTitle)
//                .fontWeight(.heavy)
//                .foregroundStyle(.orange)
//            Text("Track your ring temptations")
//                .foregroundStyle(.white)

            RingElem(current_game: current_game, caller: caller)
            
        }
        .frame(width: UIScreen.main.bounds.height * 0.9, height: UIScreen.main.bounds.width * 0.9)
    }
}

#Preview {
    RingTrack(current_game: ActiveGame(player_count: 0, starting_life: 40), caller: Player(life_total: 0, name: "Player"))
}
