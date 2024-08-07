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
    @State private var changeOpacity: Double = 0.0
    @State private var changeOffset: CGFloat = -60

    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                ZStack (content: {
                    HStack (spacing: 0.0, content: {
                        Button {
                            modifyLife(by: -1)
                            
                        } label: {
                            UnevenRoundedRectangle(cornerRadii: .init(
                                topLeading: 50.0,
                                bottomLeading: 50.0,
                                bottomTrailing: 00.0,
                                topTrailing: 00.0),
                                                   style: .continuous)
                            .padding([.top, .leading, .bottom], 5.0)
                            .padding(.trailing, -1.0)
                            .foregroundColor(block_color)
                        }
                        
                        Button {
                            modifyLife(by: 1)
                        } label: {
                            UnevenRoundedRectangle(cornerRadii: .init(
                                topLeading: 0.0,
                                bottomLeading: 0.0,
                                bottomTrailing: 50.0,
                                topTrailing: 50.0),
                                                   style: .continuous)
                            .padding([.top, .bottom, .trailing], 5.0)
                            .padding(.leading, -1.0)
                            .foregroundColor(block_color)
                        }
                        
                    })
                    
                    HStack {
                        Text(String(player.life_total))
                            .font(.system(size: 80))
                            .fontWeight(.bold)
                            .foregroundColor(Color.white)
                            .multilineTextAlignment(.center)
                            .minimumScaleFactor(0.1)
                            .lineLimit(1)
                            .padding()
                            .rotationEffect(Angle(degrees: 90))
                            .scaleEffect(scale)
                            .animation(.easeInOut(duration: 0.3), value: scale)
                            .gesture(TapGesture(count: 2).onEnded { _ in
                                let generator = UIImpactFeedbackGenerator(style: .heavy)
                                generator.prepare()
                                generator.impactOccurred()
                                print(game.current_rotation)
                                game.showing_circle_menu = false
                                withAnimation {
                                    game.showing_keypad = true
                                }
                                game.current_rotation = player.rotation
                                game.caller = self.player
                            })
                            .gesture(LongPressGesture(minimumDuration: 0.2).onEnded { _ in
                                print("OPEN PLAYER SETTINGS")
                                withAnimation {
                                    game.caller = player
                                    game.showing_player_menu = true
                                }
                            })
                        
                    }
                    HStack {
                        if recent_change != 0 {
                            Text(recent_change > 0 ? "+\(recent_change)" : "\(recent_change)")
                                .rotationEffect(Angle(degrees: 90))
                                .font(.system(size: 25))
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .opacity(changeOpacity)
                                .offset(x: changeOffset)
                                .animation(.easeIn(duration: 0.5), value: changeOpacity)
                            //.transition(.move(edge: .bottom).combined(with: .opacity))
                                .onAppear {
                                    changeOpacity = 1
                                    changeOffset = -50
                                }
                        }
                    }
                    HStack {
                        Spacer()
                            .frame(width: 90.0)
                        Text(String(player.name))
                            .foregroundStyle(.white)
                            .fontWeight(.bold)
                            .rotationEffect(Angle(degrees: 90))
                            .disabled(true)
                    }
                    
                    // Commander Damage Button
                    
                    VStack{
                        if player.rotation == 90 {
                            Spacer()
                            HStack {
                                Spacer()
                                    .frame(width: 30.0)
                                Button {
                                    game.caller = player
                                    withAnimation {
                                        game.showing_commander_damage.toggle()
                                    }
                                } label: {
                                    Image("CommanderDamage")
                                        .resizable(resizingMode: .stretch)
                                        .frame(width: 50, height: 50)
                                        .opacity(0.2)
                                }
                                Spacer()
                            }
                            Spacer()
                                .frame(height: 30.0)
                        } else if player.rotation == 180 {
                            Spacer()
                            HStack {
                                Spacer()
                                    .frame(width: 50.0)
                                Button {
                                    game.caller = player
                                    withAnimation {
                                        game.showing_commander_damage.toggle()
                                    }
                                } label: {
                                    Image("CommanderDamage")
                                        .resizable(resizingMode: .stretch)
                                        .frame(width: 50, height: 50)
                                        .opacity(0.2)
                                }
                                Spacer()
                            }
                            Spacer()
                        } else if player.rotation == 0 {
                            Spacer()
                            HStack {
                                Spacer()
                                    .frame(width: 50.0)
                                Button {
                                    game.caller = player
                                    withAnimation {
                                        game.showing_commander_damage.toggle()
                                    }
                                } label: {
                                    Image("CommanderDamage")
                                        .resizable(resizingMode: .stretch)
                                        .frame(width: 50, height: 50)
                                        .opacity(0.2)
                                }
                                Spacer()
                            }
                            Spacer()
                        } else {
                            Spacer()
                                .frame(height: 30.0)
                            HStack {
                                Spacer()
                                    .frame(width: 30.0)
                                Button {
                                    game.caller = player
                                    withAnimation {
                                        game.showing_commander_damage.toggle()
                                    }
                                } label: {
                                    Image("CommanderDamage")
                                        .resizable(resizingMode: .stretch)
                                        .frame(width: 50, height: 50)
                                        .opacity(0.2)
                                }
                                Spacer()
                            }
                            Spacer()
                        }
                        
                    }
                })
                
                // Commander Damage Display
                
                if game.showing_commander_damage {
                    BackgroundRectangle(current_game: game)
                }
                if player.rotation == 180 || player.rotation == 0 {
                    if game.showing_commander_damage {
                        ZStack {
                            CommanderDamageDisplay(player: player, current_game: game)
                            // Ensure it stays on top
                        }
                        .padding(50.0)
                        .frame(height: geometry.size.height)
                        .zIndex(1)
                        .transition(.zoomEffect)
                        .rotationEffect(Angle(degrees: 180 + player.rotation - game.caller.rotation))
                        
                    }
                } else {
                    if game.caller.rotation != 0 && game.caller.rotation != 180 {
                        if game.showing_commander_damage {
                            ZStack {
                                CommanderDamageDisplay(player: player, current_game: game)
                            }
                            .zIndex(1)
                            .padding(20.0)
                            .rotationEffect(Angle(degrees: player.rotation - game.caller.rotation))
                            .frame(width: geometry.size.width, height:geometry.size.height)
                            .transition(.zoomEffect)
                            
                            
                        }
                    } else {
                        if game.showing_commander_damage {
                            ZStack {
                                CommanderDamageDisplay(player: player, current_game: game)
                            }
                            .zIndex(1)
                            .padding(-10.0)
                            .rotationEffect(Angle(degrees: player.rotation - game.caller.rotation))
                            .frame(width: geometry.size.width, height:geometry.size.height)
                            .transition(.zoomEffect)
                            
                            
                        }
                    }
                    
                }
                    
            }
            .frame(width: geometry.size.width, height: geometry.size.height)
            .rotationEffect(Angle(degrees: player.rotation - 90))
            .scaledToFill()
            
        }
    }
    
    func modifyLife(by amount: Int) {
        let generator = UIImpactFeedbackGenerator(style: amount < 0 ? .heavy : .heavy)
        generator.prepare()
        withAnimation(.easeIn(duration: 0.3)) {
            player.life_total += amount
            recent_change += amount
        }

        triggerAnimation()
        generator.impactOccurred()
        
        resetWorkItem?.cancel()
        let workItem = DispatchWorkItem {
            withAnimation(.easeOut(duration: 0.2)) {
                recent_change = 0
                changeOpacity = 0
                changeOffset = -60
            }
        }
        resetWorkItem = workItem
        DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: workItem)
        lastUpdated = Date() // Update the time of the last change
    }
    
    func triggerAnimation() {
        scale = 0.9  // Scale up to 110%
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.15) {
            self.scale = 1.0  // Scale back to normal
        }
    }
}

#Preview {
    LifeBlock(block_color: .red, player: Player(life_total: 30, name: "PLAYER 1"), game: ActiveGame(player_count: 4, starting_life: 40))
}
