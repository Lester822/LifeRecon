//
//  PlayerMenu.swift
//  LifeRecon
//
//  Created by Michael Stang on 5/27/24.
//

import SwiftUI

struct PlayerMenu: View {
    @ObservedObject var current_game: ActiveGame
    @State private var isEditingName = false
    @State private var playerName: String
    
    init(current_game: ActiveGame) {
        self.current_game = current_game
        self._playerName = State(initialValue: current_game.caller.name)
    }
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25.0)
                .frame(width: UIScreen.main.bounds.height * 0.8, height: UIScreen.main.bounds.width * 0.8)
                .foregroundColor(.black)
                .opacity(0.5)
            VStack {
                Text(playerName)
                    .bold()
                    .font(.system(size: 25))
                    .onTapGesture {
                        isEditingName = true
                    }
                Spacer()
                    .frame(height: 20.0)
                HStack {
                    NumberCircle(number: $current_game.caller.white_mana, block_color: .yellow, player: current_game.caller, current_game: current_game)
                    NumberCircle(number: $current_game.caller.blue_mana, block_color: .blue, player: current_game.caller, current_game: current_game)
                    NumberCircle(number: $current_game.caller.black_mana, block_color: .black, player: current_game.caller, current_game: current_game)
                    NumberCircle(number: $current_game.caller.red_mana, block_color: .red, player: current_game.caller, current_game: current_game)
                    NumberCircle(number: $current_game.caller.green_mana, block_color: .green, player: current_game.caller, current_game: current_game)
                }
            }
        }
        .sheet(isPresented: $isEditingName) {
            NameEditView(playerName: $playerName, isEditingName: $isEditingName) {
                current_game.caller.name = playerName
            }
        }
    }
}

struct NameEditView: View {
    @Binding var playerName: String
    @Binding var isEditingName: Bool
    @FocusState private var isTextFieldFocused: Bool
    var onCommit: () -> Void
    
    var body: some View {
        VStack {
            TextField("Enter name", text: $playerName, onCommit: {
                onCommit()
                isEditingName = false
            })
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .padding()
            .focused($isTextFieldFocused) // Bind the focus state to the text field
            .onAppear {
                isTextFieldFocused = true // Set the focus when the view appears
            }
            Button("Done") {
                onCommit()
                isEditingName = false
            }
            .padding()
        }
        .padding()
    }
}

#Preview {
    PlayerMenu(current_game: ActiveGame(player_count: 4, starting_life: 40))
}
