//
//  LifeReconApp.swift
//  LifeRecon
//
//  Created by Recon Dev on 4/9/24.
//

import SwiftUI



@main
struct LifeReconApp: App {
    var body: some Scene {
        WindowGroup {
            ZStack{
                Rectangle().fill(LinearGradient(gradient: Gradient(colors: [.orange, .red]), startPoint: .top, endPoint: .bottom))
                    .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                PageManager(current_game: ActiveGame(player_count: 0, starting_life: 40))
                    .edgesIgnoringSafeArea(.all)
            }
            
        }
    }
}
