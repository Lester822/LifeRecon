import SwiftUI

struct CommanderDamageDisplay: View {
    @ObservedObject var player: Player
    @ObservedObject var current_game: ActiveGame
    
    var body: some View {
        VStack { // Start of Frame Spacer Stack
            Spacer()
                .frame(height: 50.0)
            Circle()
                .padding(.horizontal, 20.0) // Maybe use circle menu
            if player.commander_count > 1 {
                Circle()
                    .padding(.horizontal, 20.0)
                    .transition(.zoomEffect)
                Spacer()
                    .frame(height: 50.0)
                
            } 
            if player.commander_count == 1 {
                
                Button {
                    // Ensure changes are made on the main thread
                    withAnimation {
                        current_game.caller.commander_damage[player.player_number].append(0)
                        player.commander_count = 2
                    }
                    
                } label: {
                    ZStack {
                        Circle()
                            .frame(width: 50, height: 50)
                            .foregroundColor(.white) // Maybe use circle menu
                        Text("+")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.green)
                    }
                }
            }
        }  // End of Frame Spacer Stack
    }
}

#Preview {
    CommanderDamageDisplay(player: Player(life_total: 10, name: "Name") ,current_game: ActiveGame(player_count: 4, starting_life: 40))
}
