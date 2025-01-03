//
//  LifeBlock.swift
//  LifeRecon
//
//  Created by Michael Stang on 4/9/24.
//

import SwiftUI
import UIKit

struct LifeBlockA: View {
    @ObservedObject var player: Player
    @ObservedObject var game: ActiveGame
    @State private var showing_alert = false
    @State private var user_input = ""
    @State private var recent_change = 0
    @State private var lastUpdated: Date? = nil
    @State private var resetWorkItem: DispatchWorkItem?
    @State private var scale: CGFloat = 1.0
    @State private var changeOpacity: Double = 0.0
    @State private var changeOffset: CGFloat =  -60

    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                
//               RoundedRectangle(cornerRadius: 50.0) // This is the actual background color
//                    .foregroundColor(block_color)
//                    .padding([.top, .bottom, .trailing, .leading], 5.0)
                if player.background_image != "NONE" {
                    Image(player.background_image)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: geometry.size.width - 10, height: geometry.size.height - 10) // Ensure the image fits within the padding
                        .clipShape(RoundedRectangle(cornerRadius: BLOCK_CORNER)) // Clips the image to the rounded rectangle shape
                        .clipped() // Ensures no overflow
                        .blur(radius: 2.0)
                        .allowsHitTesting(false)
                } else {
                    RoundedRectangle(cornerRadius: BLOCK_CORNER) // This is the actual background color
                        .foregroundColor(player.background_color)
                        .padding([.top, .bottom, .trailing, .leading], 5.0)
                        .frame(width: geometry.size.width, height: geometry.size.height)
                }
                

                ZStack (content: {  // THIS IS THE ZSTACK FOR THE INTERACTABLE-PARTS
                    if player.vertical_increment {
                        VStack (spacing: 0.0, content: {
                            Button {
                                modifyLife(by: 1)
                                
                            } label: {
                                UnevenRoundedRectangle(cornerRadii: .init(
                                    topLeading: BLOCK_CORNER,
                                    bottomLeading: 00.0,
                                    bottomTrailing: 00.0,
                                    topTrailing: BLOCK_CORNER),
                                                       style: .continuous)
                                .padding([.top, .leading, .trailing], 5.0)
                                .padding(.bottom, 0.0)
                                .foregroundColor(.black)
                                //.opacity(0.05)
                            }
                            .buttonStyle(OpacityButton())
                            
                            Button {
                                modifyLife(by: -1)
                            } label: {
                                UnevenRoundedRectangle(cornerRadii: .init(
                                    topLeading: 0.0,
                                    bottomLeading: BLOCK_CORNER,
                                    bottomTrailing: BLOCK_CORNER,
                                    topTrailing: 00.0),
                                                       style: .continuous)
                                .padding([.leading, .bottom, .trailing], 5.0)
                                .padding(.top, 0.0)
                                .foregroundColor(.black)
                                //.opacity(0.05)
                            }
                            .buttonStyle(OpacityButton())
                            
                        })
                    } else {
                        HStack (spacing: 0.0, content: {
                            Button {
                                modifyLife(by: -1)
                                
                            } label: {
                                UnevenRoundedRectangle(cornerRadii: .init(
                                    topLeading: BLOCK_CORNER,
                                    bottomLeading: BLOCK_CORNER,
                                    bottomTrailing: 00.0,
                                    topTrailing: 0.0),
                                                       style: .continuous)
                                .padding([.top, .leading, .trailing], 5.0)
                                .padding(.bottom, 0.0)
                                .foregroundColor(.black)
                                //.opacity(0.05)
                            }
                            .buttonStyle(OpacityButton())
                            
                            Button {
                                modifyLife(by: 1)
                            } label: {
                                UnevenRoundedRectangle(cornerRadii: .init(
                                    topLeading: 0.0,
                                    bottomLeading: 0.0,
                                    bottomTrailing: BLOCK_CORNER,
                                    topTrailing: BLOCK_CORNER),
                                                       style: .continuous)
                                .padding([.leading, .bottom, .trailing], 5.0)
                                .padding(.top, 0.0)
                                .foregroundColor(.black)
                                //.opacity(0.05)
                            }
                            .buttonStyle(OpacityButton())
                            
                        })
                    }
                    
                    
                    VStack {
                        Text(String(player.life_total))
                            .font(.system(size: 80))
                            .fontWeight(.bold)
                            .foregroundColor(Color.white)
                            .multilineTextAlignment(.center)
                            .minimumScaleFactor(0.1)
                            .lineLimit(1)
                            .padding()
                            .scaleEffect(scale)
                            .animation(.easeInOut(duration: 0.3), value: scale)
                            .gesture(TapGesture(count: 2).onEnded { _ in
                            })
                            .gesture(LongPressGesture(minimumDuration: 0.2).onEnded { _ in
                                let generator = UIImpactFeedbackGenerator(style: .heavy)
                                generator.prepare()
                                generator.impactOccurred()
                                print(game.current_rotation)
                                withAnimation {
                                    game.showing_keypad = true
                                    game.blur_background = true
                                }
                                game.current_rotation = player.rotation
                                game.caller = self.player
                            })
                            .gesture(DragGesture().onEnded { gesture in
                                //let verticalMovement = gesture.translation.height
                                let horizontalMovement = gesture.translation.height
                                if (horizontalMovement > 0) {
                                        print("OPEN PLAYER SETTINGS")
                                    medium_haptic_pulse()
                                    
                                    if player.storm_count != 0 {
                                        player.active_counters.append("storm")
                                    } else if player.active_counters.contains("storm") {
                                        if let index = player.active_counters.firstIndex(of: "storm") {
                                            player.active_counters.remove(at: index)
                                        }
                                    }
                                    
                                    if player.poison_counters != 0 {
                                        player.active_counters.append("poison")
                                    } else if player.active_counters.contains("poison") {
                                        if let index = player.active_counters.firstIndex(of: "poison") {
                                            player.active_counters.remove(at: index)
                                        }
                                    }
                                    
                                    if player.rad_counters != 0 {
                                        player.active_counters.append("rad")
                                    } else if player.active_counters.contains("rad") {
                                        if let index = player.active_counters.firstIndex(of: "rad") {
                                            player.active_counters.remove(at: index)
                                        }
                                    }
                                    
                                    if player.experience_counters != 0 {
                                        player.active_counters.append("experience")
                                    } else if player.active_counters.contains("experience") {
                                        if let index = player.active_counters.firstIndex(of: "experience") {
                                            player.active_counters.remove(at: index)
                                        }
                                    }
                                    
                                    if player.energy_counters != 0 {
                                        player.active_counters.append("energy")
                                    } else if player.active_counters.contains("energy") {
                                        if let index = player.active_counters.firstIndex(of: "energy") {
                                            player.active_counters.remove(at: index)
                                        }
                                    }
                                    
                                    if player.ticket_counters != 0 {
                                        player.active_counters.append("ticket")
                                    } else if player.active_counters.contains("ticket") {
                                        if let index = player.active_counters.firstIndex(of: "ticket") {
                                            player.active_counters.remove(at: index)
                                        }
                                    }
                                    
                                    if player.acorn_counters != 0 {
                                        player.active_counters.append("acorn")
                                    } else if player.active_counters.contains("acorn") {
                                        if let index = player.active_counters.firstIndex(of: "acorn") {
                                            player.active_counters.remove(at: index)
                                        }
                                    }
                                    
                                    if player.commander_tax_1 != 0 {
                                        player.active_counters.append("commandertax1")
                                    } else if player.active_counters.contains("commandertax1") {
                                        if let index = player.active_counters.firstIndex(of: "commandertax1") {
                                            player.active_counters.remove(at: index)
                                        }
                                    }
                                    
                                    if player.commander_tax_2 != 0 {
                                        player.active_counters.append("commandertax2")
                                    } else if player.active_counters.contains("commandertax2") {
                                        if let index = player.active_counters.firstIndex(of: "commandertax2") {
                                            player.active_counters.remove(at: index)
                                        }
                                    }
                                    
                                    if player.commander_count != 1 {
                                        player.active_counters.append("commandercount")
                                    } else if player.active_counters.contains("commandercount") {
                                        if let index = player.active_counters.firstIndex(of: "commandercount") {
                                            player.active_counters.remove(at: index)
                                        }
                                    }
                                    
                                    withAnimation {
                                        game.caller = player
                                        game.temporary_rotate = game.caller.rotation + 90
                                        game.temporary_rotate_applied = false
                                        game.showing_player_menu = true
                                        game.blur_background = true
                                    }
                                }
                            })
                    }
                    
                    VStack {
                        if recent_change != 0 {
                            Text(recent_change > 0 ? "+\(recent_change)" : "\(recent_change)")
                                .font(.system(size: 25))
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .allowsHitTesting(false)
                                .opacity(changeOpacity)
                                .offset(y: -changeOffset)
                                .animation(.easeIn(duration: 0.5), value: changeOpacity)
                            //.transition(.move(edge: .bottom).combined(with: .opacity))
                                .onAppear {
                                    changeOpacity = 1
                                    changeOffset = -50
                                }
                        }
                    }
                    VStack {
                        Text(String(player.name))
                            .foregroundStyle(.white)
                            .fontWeight(.bold)
                            .allowsHitTesting(false)
                            .multilineTextAlignment(.center)
                            .minimumScaleFactor(0.1)
                            .lineLimit(1)
                        Spacer()
                            .frame(height: 90.0)
                        }
                    
                        VStack {
                            HStack {
                                if player.is_monarch == true {
                                    Image("MonarchIcon")
                                    .resizable(resizingMode: .stretch)
                                    .frame(width: 40.0, height: 40.0)
                                    .allowsHitTesting(false)
                                    .zIndex(0.9)
                                    .transition(.zoomEffect)
                                }
                                if player.has_initiative == true {
                                    Image("InitiativeIcon")
                                    .resizable(resizingMode: .stretch)
                                    .frame(width: 40.0, height: 40.0)
                                    .allowsHitTesting(false)
                                    .zIndex(0.9)
                                    .transition(.zoomEffect)
                                }
                                if player.has_cities_blessing == true {
                                    Image("CitiesBlessingIcon")
                                        .resizable(resizingMode: .stretch)
                                        .frame(width: 40.0, height: 40.0)
                                        .allowsHitTesting(false)
                                        .zIndex(0.9)
                                        .transition(.zoomEffect)
                                }
                            }
                            Spacer()
                                .frame(height: 150.0)
                    }
                    
                    
                    // Commander Damage Button
                    
                    VStack{
                        Spacer()
                        VStack {
                            if game.commander_features_enabled {
                                Button {
                                    game.caller = player
                                    soft_haptic_pulse()
                                    withAnimation {
                                        game.showing_commander_damage.toggle()
                                    }
                                } label: {
                                    Image("CommanderDamage")
                                        .resizable(resizingMode: .stretch)
                                        .frame(width: 50, height: 50)
                                        .opacity(0.2)
                                }
                            }
                            
                            Spacer()
                                .frame(height: 70.0)
                        }
                    }
                })
                
                // Commander Damage Display
                
                if game.showing_commander_damage { // The overlay when commander damage is up to hide behind it
                    RoundedRectangle(cornerRadius: BLOCK_CORNER)
                        .foregroundColor(player.background_color)
                        .padding([.top, .bottom, .trailing, .leading], 5.0)
                        .transition(.fade)
                        .allowsHitTesting(game.showing_commander_damage)
                    if !(game.caller === player) {
                        RoundedRectangle(cornerRadius: BLOCK_CORNER)
                            .foregroundColor(.black)
                            .padding([.top, .bottom, .trailing, .leading], 5.0)
                            .opacity(0.5)
                            .transition(.fade)
                    }
                }
                
                if game.showing_commander_damage {
                    BackgroundRectangle(current_game: game)
                        .opacity(0.1)
                }
                if game.showing_commander_damage {
                        ZStack {
                            CommanderDamageDisplay(player: player, current_game: game)
                            // Ensure it stays on top
                        }
                        .padding(50.0)
                        .frame(height: geometry.size.height)
                        .zIndex(1)
                        .transition(.zoomEffect)
                        .rotationEffect(Angle(degrees: 90 + player.rotation - game.caller.rotation))
                        
                    }
                }
            .frame(width: geometry.size.width, height: geometry.size.height)
            .rotationEffect(Angle(degrees: player.rotation))
            
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
    LifeBlockA(player: Player(life_total: 30, name: "PLAYER 1"), game: ActiveGame(player_count: 4, starting_life: 40))
}
