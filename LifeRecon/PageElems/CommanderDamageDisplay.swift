import SwiftUI

// Player is the person whose block appears below the circle
// current_game.caller is the person who clicks it

struct CommanderDamageDisplay: View {
    @ObservedObject var player: Player
    @ObservedObject var current_game: ActiveGame
    
    var body: some View {
        if current_game.caller.rotation != 0 && current_game.caller.rotation != 180 {
            VStack { // Start of Frame Spacer Stack
                Spacer()
                    .frame(height: 70.0)
                NumberCircle(number: $current_game.caller.commander_damage[player.player_number][0], block_color: .black, player: current_game.caller, current_game: current_game)
                    //.padding(.horizontal, 20.0)
                    .transition(.zoomEffect)
                    .rotationEffect(Angle(degrees: 90.0))
                if player.commander_count > 1 {
                    NumberCircle(number: $current_game.caller.commander_damage[player.player_number][1], block_color: .black, player: current_game.caller, current_game: current_game)
                        //.padding(.horizontal, 20.0)
                        .transition(.zoomEffect)
                        .rotationEffect(Angle(degrees: 90.0))
                    Spacer()
                        .frame(height: 70.0)
                    
                }
                if player.commander_count == 1 {
                    
                    Button {
                        // Ensure changes are made on the main thread
                        withAnimation {
                            for each_player in current_game.players {
                                each_player.commander_damage[player.player_number].append(0)
                            }
                            
                            player.commander_count = 2
                        }
                        
                    } label: {
                        ZStack {
                            Image("AddIcon")
                                .resizable(resizingMode: .stretch)
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 70, height: 70)
                                
                        }
                    }
                }
            }  // End of Frame Spacer Stack
            .padding(player.commander_count > 1 && (player.rotation == 0 || player.rotation == 180) ? -60 : 0)
        } else {
            HStack { // Start of Frame Spacer Stack
                NumberCircle(number: $current_game.caller.commander_damage[player.player_number][0], block_color: .black, player: current_game.caller, current_game: current_game)
                    .padding(0.0)
                    .transition(.zoomEffect)
                    .rotationEffect(Angle(degrees: 270.0))
                if player.commander_count > 1 {
                    NumberCircle(number: $current_game.caller.commander_damage[player.player_number][1], block_color: .black, player: current_game.caller, current_game: current_game)
                        .transition(.zoomEffect)
                        .rotationEffect(Angle(degrees: 270.0))
                    
                }
                if player.commander_count == 1 {
                    
                    Button {
                        // Ensure changes are made on the main thread
                        withAnimation {
                            for each_player in current_game.players {
                                each_player.commander_damage[player.player_number].append(0)
                            }
                            
                            player.commander_count = 2
                        }
                        
                    } label: {
                        ZStack {
                            Image("AddIcon")
                                .resizable(resizingMode: .stretch)
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 70, height: 70)
                                
                        }
                        .padding(0.0)
                    }
                }
            }  // End of Frame Spacer Stack
            .padding(player.commander_count > 1 && (player.rotation != 0 && player.rotation != 180) ? -30 : 0)
        }
            
        
    }
}

#Preview {
    CommanderDamageDisplay(player: Player(life_total: 10, name: "Name") ,current_game: ActiveGame(player_count: 4, starting_life: 40))
}
