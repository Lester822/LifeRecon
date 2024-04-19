//
//  LifeBlock.swift
//  LifeRecon
//
//  Created by Michael Stang on 4/9/24.
//

import SwiftUI
import UIKit

struct LifeBlock: View {
    var block_color: Color
    @ObservedObject var player: Player
    @ObservedObject var game: ActiveGame
    @State private var showing_alert = false
    @State private var user_input = ""
    @State private var recent_change = 0
    @State private var lastUpdated: Date? = nil
    @State private var resetWorkItem: DispatchWorkItem?
    @State private var scale: CGFloat = 1.0
//    @State private var refreshID = UUID()

    
    var body: some View {
        ZStack (content: {
            HStack (spacing: 0.0, content: {
                Button {
                    let generator = UIImpactFeedbackGenerator(style: .medium)
                    generator.prepare()
                    player.life_total = player.life_total - 1
                    player.life_total = player.life_total
                    recent_change -= 1
                    triggerAnimation()
                    print(recent_change)
                    generator.impactOccurred()
                    
                    // Cancel the previous work item if it exists
                    resetWorkItem?.cancel()

                    // Create a new DispatchWorkItem
                    let workItem = DispatchWorkItem {
                        recent_change = 0
                    }

                    // Save the new work item to the state
                    resetWorkItem = workItem
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: workItem)
                    lastUpdated = Date() // Update the time of the last change
                    
                } label: {
                    UnevenRoundedRectangle(cornerRadii: .init(
                                                                        topLeading: 50.0,
                                                                        bottomLeading: 50.0,
                                                                        bottomTrailing: 00.0,
                                                                        topTrailing: 00.0),
                                           style: .continuous)
                    .padding([.top, .leading, .bottom], 5.0)
                    .foregroundColor(block_color)
                }

                Button {
                    let generator = UIImpactFeedbackGenerator(style: .soft)
                    generator.prepare()
                    player.life_total = player.life_total + 1
                    player.life_total = player.life_total
                    recent_change += 1
                    triggerAnimation()
                    print(recent_change)
                    generator.impactOccurred()
                    resetWorkItem?.cancel()

                    // Create a new DispatchWorkItem
                    let workItem = DispatchWorkItem {
                        recent_change = 0
                    }

                    // Save the new work item to the state
                    resetWorkItem = workItem
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: workItem)
                    lastUpdated = Date() // Update the time of the last change
                    
                } label: {
                    UnevenRoundedRectangle(cornerRadii: .init(
                        topLeading: 0.0,
                        bottomLeading: 0.0,
                        bottomTrailing: 50.0,
                        topTrailing: 50.0),
                                           style: .continuous)
                    .padding([.top, .bottom, .trailing], 5.0)
                    .foregroundColor(block_color)
                }
                
            })
           
            HStack {

                Text(String(player.life_total))
                    .font(.system(size: 80))
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                    .minimumScaleFactor(0.1)
                    .lineLimit(1)
                    .padding()
                    .rotationEffect(Angle(degrees: 90))
                    .scaleEffect(scale)
                    .animation(.easeInOut(duration: 0.3), value: scale)
                    .gesture(LongPressGesture(minimumDuration: 0.1).onEnded { _ in
                        withAnimation {
                            let generator = UIImpactFeedbackGenerator(style: .heavy)
                            generator.prepare()
                            game.showing_circle_menu = false
                            game.showing_keypad = true
                            game.caller = self.player
                            print("Click!")
                        }
                    })
    //            HStack {
    //                VStack {
    //                    Spacer()
    //                    Button {
    //                        print("SETTINGS")
    //                    } label: {
    //                        Image("Settings")
    //                            .resizable(resizingMode: .stretch)
    //                            .padding([.leading, .bottom], 20.0)
    //                            .frame(width: 50.0, height: 50.0)
    //                    }
    //                }
    //                Spacer()
    //            }
            }

        })
    }
    func triggerAnimation() {
        scale = 0.9  // Scale up to 110%
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.15) {
            self.scale = 1.0  // Scale back to normal
        }
    }
}

#Preview {
    LifeBlock(block_color: .red, player: Player(life_total: 30), game: ActiveGame(player_count: 4, starting_life: 40))
}
