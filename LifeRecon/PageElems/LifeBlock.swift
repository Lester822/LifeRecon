//
//  LifeBlock.swift
//  LifeRecon
//
//  Created by Michael Stang on 4/9/24.
//

import SwiftUI
import UIKit

let BLOCK_CORNER = 40.0

struct LifeBlock: View {
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
                        .rotationEffect(Angle(degrees: 90))
                        .frame(width: geometry.size.width - 10, height: geometry.size.height - 10) // Ensure the image fits within the padding
                        .clipShape(RoundedRectangle(cornerRadius: BLOCK_CORNER)) // Clips the image to the rounded rectangle shape
                        .clipped() // Ensures no overflow
                        .blur(radius: 2.0)
                        .allowsHitTesting(false)
                } else {
                    RoundedRectangle(cornerRadius: BLOCK_CORNER) // This is the actual background color
                        .foregroundColor(player.background_color)
                        .padding([.top, .bottom, .trailing, .leading], 5.0)
                }
                

                ZStack (content: {  // THIS IS THE ZSTACK FOR THE INTERACTABLE-PARTS
                    if player.vertical_increment {
                        HStack (spacing: 0.0, content: {
                            Button {
                                modifyLife(by: -1)
                                
                            } label: {
                                UnevenRoundedRectangle(cornerRadii: .init(
                                    topLeading: BLOCK_CORNER,
                                    bottomLeading: BLOCK_CORNER,
                                    bottomTrailing: 00.0,
                                    topTrailing: 00.0),
                                                       style: .continuous)
                                .padding([.top, .leading, .bottom], 5.0)
                                .padding(.trailing, 0.0)
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
                                .padding([.top, .bottom, .trailing], 5.0)
                                .padding(.leading, 0.0)
                                .foregroundColor(.black)
                                //.opacity(0.05)
                            }
                            .buttonStyle(OpacityButton())
                            
                        })
                    } else {
                        VStack (spacing: 0.0, content: {
                            Button {
                                modifyLife(by: -1)
                                
                            } label: {
                                UnevenRoundedRectangle(cornerRadii: .init(
                                    topLeading: BLOCK_CORNER,
                                    bottomLeading: 0.0,
                                    bottomTrailing: 00.0,
                                    topTrailing: BLOCK_CORNER),
                                                       style: .continuous)
                                .padding([.top, .leading, .bottom], 5.0)
                                .padding(.trailing, 0.0)
                                .foregroundColor(.black)
                                //.opacity(0.05)
                            }
                            .buttonStyle(OpacityButton())
                            
                            Button {
                                modifyLife(by: 1)
                            } label: {
                                UnevenRoundedRectangle(cornerRadii: .init(
                                    topLeading: 0.0,
                                    bottomLeading: BLOCK_CORNER,
                                    bottomTrailing: BLOCK_CORNER,
                                    topTrailing: 0.0),
                                                       style: .continuous)
                                .padding([.top, .bottom, .trailing], 5.0)
                                .padding(.leading, 0.0)
                                .foregroundColor(.black)
                                //.opacity(0.05)
                            }
                            .buttonStyle(OpacityButton())
                            
                        })
                    }
                    
                    
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
                            .gesture(LongPressGesture(minimumDuration: 0.2).onEnded { _ in
                                let generator = UIImpactFeedbackGenerator(style: .heavy)
                                generator.prepare()
                                generator.impactOccurred()
                                print(game.current_rotation)
                                game.showing_circle_menu = false
                                withAnimation {
                                    game.showing_keypad = true
                                    game.blur_background = true
                                }
                                game.current_rotation = player.rotation
                                game.caller = self.player
                            })
                            .gesture(DragGesture().onEnded { gesture in
                                //let verticalMovement = gesture.translation.height
                                let horizontalMovement = gesture.translation.width
                                if (horizontalMovement < 0) {
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
                                    
                                    if player.commander_count > 1 {
                                        player.active_counters.append("commandercount")
                                    } else if player.active_counters.contains("commandercount") {
                                        if let index = player.active_counters.firstIndex(of: "commandercount") {
                                            player.active_counters.remove(at: index)
                                        }
                                    }
                                    
                                    withAnimation {
                                        game.caller = player
                                        game.showing_player_menu = true
                                        game.blur_background = true
                                    }
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
                                .allowsHitTesting(false)
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
                            .allowsHitTesting(false)
                            .multilineTextAlignment(.center)
                            .minimumScaleFactor(0.1)
                            .lineLimit(1)
                        }
                    
                        HStack {
                            Spacer()
                                .frame(width: 150.0)
                            VStack {
                                if player.is_monarch == true {
                                    Image("MonarchIcon")
                                    .resizable(resizingMode: .stretch)
                                    .frame(width: 40.0, height: 40.0)
                                    .rotationEffect(Angle(degrees: 90.0))
                                    .allowsHitTesting(false)
                                    .zIndex(0.9)
                                    .transition(.zoomEffect)
                                }
                                if player.has_initiative == true {
                                    Image("InitiativeIcon")
                                    .resizable(resizingMode: .stretch)
                                    .frame(width: 40.0, height: 40.0)
                                    .rotationEffect(Angle(degrees: 90.0))
                                    .allowsHitTesting(false)
                                    .zIndex(0.9)
                                    .transition(.zoomEffect)
                                }
                                if player.has_cities_blessing == true {
                                    Image("CitiesBlessingIcon")
                                        .resizable(resizingMode: .stretch)
                                        .frame(width: 40.0, height: 40.0)
                                        .rotationEffect(Angle(degrees: 90.0))
                                        .allowsHitTesting(false)
                                        .zIndex(0.9)
                                        .transition(.zoomEffect)
                                }
                            }
                    }
                    
                    
                    // Commander Damage Button
                    
                    VStack{
                        if player.rotation == 90 {
                            Spacer()
                            HStack {
                                Spacer()
                                    .frame(width: 30.0)
                                if game.commander_features_enabled {
                                    Button {
                                        soft_haptic_pulse()
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
                                }
                                
                                Spacer()
                            }
                            Spacer()
                                .frame(height: 30.0)
                        } else { // THIS IS NEEDED TO ALIGN SWORD
                            Spacer()
                                .frame(height: 30.0)
                            HStack {
                                Spacer()
                                    .frame(width: 30.0)
                                if game.commander_features_enabled {
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
    LifeBlock(player: Player(life_total: 30, name: "PLAYER 1"), game: ActiveGame(player_count: 4, starting_life: 40))
}
