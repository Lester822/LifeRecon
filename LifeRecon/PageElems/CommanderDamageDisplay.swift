import SwiftUI

// Player is the person whose block appears below the circle
// current_game.caller is the person who clicks it

struct CommanderDamageDisplay: View {
    @ObservedObject var player: Player
    @ObservedObject var current_game: ActiveGame
    
    var body: some View {
        if (current_game.caller.rotation != 0 && current_game.caller.rotation != 180) {
            HStack {
                
                VStack { // Start of Frame Spacer Stack
                    
                    // THIS IS CODE FOR ADDING TAX TO THE COMMANDER MENU
                    
//                    if player === current_game.caller {
//                        VStack {
//                            TaxCounter(number: $current_game.caller.commander_tax_1, block_color: .gray, player: current_game.caller, current_game: current_game)
//                                .padding(0.0)
//                            TaxCounter(number: $current_game.caller.commander_tax_2, block_color: .gray, player: current_game.caller, current_game: current_game)
//                                .padding(0.0)
//                        }
//                        .rotationEffect(Angle(degrees: 90.0))
//                    } else {
//                        Spacer()
//                            .frame(height: UIScreen.main.bounds.height * 0.3)
//                    }
                    
                    VStack {
                        if current_game.caller.rotation == -90 {
                            TaxCounter(number: $player.commander_count, block_color: .orange, type: "commander_count", player: current_game.caller, current_game: current_game)
                                .frame(height: UIScreen.main.bounds.width * 0.25)
                            
                        } else {
                            if ((player.commander_count == 1) && (player.rotation != 0 && player.rotation != 180)) {
                                Spacer()
                                    .frame(height: UIScreen.main.bounds.width * 0.1) // Spacer when non-vertical player OR vertical player w/ 1 commander (with Horizontal caller)
                            }  else {
                                Spacer()
                                    .frame(height: UIScreen.main.bounds.width * 0.05) // Spacer when vertical player w/ 2 commanders (with Horizontal caller)
                            }
                        }
                    }
                    .rotationEffect(Angle(degrees: 90.0))
                    
                    NumberCircle(number: $current_game.caller.commander_damage[player.player_number][0], block_color: current_game.caller.background_color, player: current_game.caller, current_game: current_game)
                        //.padding(.horizontal, 20.0)
                        .transition(.zoomEffect)
                        .rotationEffect(Angle(degrees: 90.0))
                    
                    if player.commander_count > 1 {
                        NumberCircle(number: $current_game.caller.commander_damage[player.player_number][1], block_color: current_game.caller.background_color, player: current_game.caller, current_game: current_game)
                            .transition(.zoomEffect)
                            .rotationEffect(Angle(degrees: 90.0))
                        
                    }
                    
                    VStack {
                        if current_game.caller.rotation == 90 {
                            TaxCounter(number: $player.commander_count, block_color: .orange, type: "commander_count", player: current_game.caller, current_game: current_game)
                                //.ignoresSafeArea(false)
                                .frame(height: UIScreen.main.bounds.width * 0.25)
                        } else {
                            if ((player.commander_count == 1) && (player.rotation != 0 && player.rotation != 180)) {
                                Spacer()
                                    .frame(height: UIScreen.main.bounds.width * 0.1)
                            } else {
                                Spacer()
                                    .frame(height: UIScreen.main.bounds.width * 0.05)
                            }
                            
                        }
                    }
                    .rotationEffect(Angle(degrees: 90.0))

                }  // End of Frame Spacer Stack
            }
            .padding(player.commander_count > 1 && (player.rotation == 0 || player.rotation == 180) ? -30 : 0)
            
        } else {
            
            // IF WE'RE A VERTICAL PLAYER CALLING
            if player.rotation == 0 || player.rotation == 180 {
                HStack {
                    VStack { // Start of Frame Spacer Stack
                        NumberCircle(number: $current_game.caller.commander_damage[player.player_number][0], block_color: current_game.caller.background_color, player: current_game.caller, current_game: current_game)
                            .transition(.zoomEffect)
                            .rotationEffect(Angle(degrees: 270.0))
                        if player.commander_count > 1 {
                            NumberCircle(number: $current_game.caller.commander_damage[player.player_number][1], block_color: current_game.caller.background_color, player: current_game.caller, current_game: current_game)
                                .transition(.zoomEffect)
                                .rotationEffect(Angle(degrees: 270.0))
                            
                        }
                        
                    }  // End of Frame Spacer Stack
                    
                    TaxCounter(number: $player.commander_count, block_color: .orange, type: "commander_count", player: current_game.caller, current_game: current_game)
                    //.ignoresSafeArea(false)
                        .padding(0)
                        .rotationEffect(Angle(degrees: 270))
                }
                .frame(height: UIScreen.main.bounds.width)
                .padding(0)
            } else {
                HStack { // Start of Frame Spacer Stack
                    NumberCircle(number: $current_game.caller.commander_damage[player.player_number][0], block_color: current_game.caller.background_color, player: current_game.caller, current_game: current_game)
                        .transition(.zoomEffect)
                        .rotationEffect(Angle(degrees: 270.0))
                    if player.commander_count > 1 {
                        NumberCircle(number: $current_game.caller.commander_damage[player.player_number][1], block_color: current_game.caller.background_color, player: current_game.caller, current_game: current_game)
                            .transition(.zoomEffect)
                            .rotationEffect(Angle(degrees: 270.0))
                        
                    }
                    TaxCounter(number: $player.commander_count, block_color: .orange, type: "commander_count", player: current_game.caller, current_game: current_game)
                    //.ignoresSafeArea(false)
                        .frame(height: UIScreen.main.bounds.width * 0.25)
                        .rotationEffect(Angle(degrees: 270))
                }  // End of Frame Spacer Stack
                .frame(width: UIScreen.main.bounds.height * 0.3)
                .padding(0)
            }
                
        }
    }
}

#Preview {
    CommanderDamageDisplay(player: Player(life_total: 10, name: "Name") ,current_game: ActiveGame(player_count: 4, starting_life: 40))
}
