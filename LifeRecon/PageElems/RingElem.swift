//
//  RingElem.swift
//  LifeRecon
//
//  Created by Michael Stang on 11/13/24.
//

import SwiftUI

struct RingElem: View {
    @ObservedObject var current_game: ActiveGame
    @ObservedObject var caller: Player

    var body: some View {
            ZStack {
                
                Image("TheRing-0")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: UIScreen.main.bounds.height*0.9, height: UIScreen.main.bounds.width*0.9)
                    .allowsHitTesting(true)
                
                // MASK
                
                VStack {
                    Spacer()
                        .frame(height: (147/1040)*UIScreen.main.bounds.height*1.15)
                    Button {
                        withAnimation {
                            caller.ring_stage = caller.ring_stage == 1 ? 0 : 1
                        }
                        
                    } label: {
                        Rectangle()
                            .foregroundStyle(.yellow)
                            .padding(.bottom, -5.0)
                            .frame(width: UIScreen.main.bounds.width*0.55, height: (147/1040)*UIScreen.main.bounds.height*0.20)
                    }
                    //.buttonStyle(OpacityButton())
                    
                    Button {
                        withAnimation {
                            caller.ring_stage = caller.ring_stage == 2 ? 1 : 2
                        }
                    } label: {
                        Rectangle()
                            .foregroundStyle(.yellow)
                            .padding(.bottom, -5.0)
                            .frame(width: UIScreen.main.bounds.width*0.55, height: (147/1040)*UIScreen.main.bounds.height*0.25)
                    }
                    //.buttonStyle(OpacityButton())
                    Button {
                        withAnimation {
                            caller.ring_stage = caller.ring_stage == 3 ? 2 : 3

                        }
                    } label: {
                        Rectangle()
                            .foregroundStyle(.yellow)
                            .padding(.bottom, -5.0)
                            .frame(width: UIScreen.main.bounds.width*0.55, height: (147/1040)*UIScreen.main.bounds.height*0.32)
                    }
                    //.buttonStyle(OpacityButton())
                    Button {
                        withAnimation {
                            caller.ring_stage = caller.ring_stage == 4 ? 3 : 4

                        }
                        
                    } label: {
                        Rectangle()
                            .foregroundStyle(.yellow)
                            .padding(.bottom, -5.0)
                            .frame(width: UIScreen.main.bounds.width*0.55, height: (147/1040)*UIScreen.main.bounds.height*0.32)
                    }
                    //.buttonStyle(OpacityButton())
                }
                Image("TheRing-0")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: UIScreen.main.bounds.height*0.9, height: UIScreen.main.bounds.width*0.9)
                    .allowsHitTesting(false)
                Image("TheRing-\(caller.ring_stage)")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                .frame(width: UIScreen.main.bounds.height*0.9, height: UIScreen.main.bounds.width*0.9)
                    .allowsHitTesting(false)
                    .transition(.fade)
                
                // END MASK
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
    }
}

#Preview {
    RingElem(current_game: ActiveGame(player_count: 4, starting_life: 40), caller: Player(life_total: 40, name: "hello there"))
}
