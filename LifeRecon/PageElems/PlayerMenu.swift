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
                    .frame(width: UIScreen.main.bounds.height * 0.85, height: UIScreen.main.bounds.width * 0.8)
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
                    ScrollView(.horizontal) {
                        HStack {
                            SquareButton(button_color: .gray, text_color: .black, title: "Test", icon: "String")
                            SquareButton(button_color: .gray, text_color: .black, title: "Test", icon: "String")
                            SquareButton(button_color: .gray, text_color: .black, title: "Test", icon: "String")
                            SquareButton(button_color: .gray, text_color: .black, title: "Test", icon: "String")
                            SquareButton(button_color: .gray, text_color: .black, title: "Test", icon: "String")
                            SquareButton(button_color: .gray, text_color: .black, title: "Test", icon: "String")
                            SquareButton(button_color: .gray, text_color: .black, title: "Test", icon: "String")
                            SquareButton(button_color: .gray, text_color: .black, title: "Test", icon: "String")
                        }
                        
                    }
                    .padding(.horizontal, 100.0)
                    
                    HStack { // Mana Floating
                        Button {
                            
                        } label: {
                            Image("Settings")
                                .resizable(resizingMode: .stretch)
                                .frame(width: 50.0, height: 50.0)
                        }
                        
                        Button {
                            
                        } label: {
                            Image("Settings")
                                .resizable(resizingMode: .stretch)
                                .frame(width: 50.0, height: 50.0)
                        }
                        NumberCircle(number: $current_game.caller.white_mana, block_color: .yellow, player: current_game.caller, current_game: current_game)
                            .frame(width: 80.0, height: 80.0)
                        NumberCircle(number: $current_game.caller.blue_mana, block_color: .blue, player: current_game.caller, current_game: current_game)
                            .frame(width: 80.0, height: 80.0)
                        NumberCircle(number: $current_game.caller.black_mana, block_color: .black, player: current_game.caller, current_game: current_game)
                            .frame(width: 80.0, height: 80.0)
                        NumberCircle(number: $current_game.caller.red_mana, block_color: .red, player: current_game.caller, current_game: current_game)
                            .frame(width: 80.0, height: 80.0)
                        NumberCircle(number: $current_game.caller.green_mana, block_color: .green, player: current_game.caller, current_game: current_game)
                            .frame(width: 80.0, height: 80.0)
                        NumberCircle(number: $current_game.caller.colorless_mana, block_color: .gray, player: current_game.caller, current_game: current_game)
                            .frame(width: 80.0, height: 80.0)
                        Button {
                            
                        } label: {
                            Image("Settings")
                                .resizable(resizingMode: .stretch)
                                .frame(width: 50.0, height: 50.0)
                        }
                        
                        Button {
                            
                        } label: {
                            Image("Settings")
                                .resizable(resizingMode: .stretch)
                                .frame(width: 50.0, height: 50.0)
                        }
                        
                    }
                }
            }
            .sheet(isPresented: $isEditingName) {
                NameEditView(starting_name: playerName, playerName: $playerName, isEditingName: $isEditingName) {
                    current_game.caller.name = playerName
                    
                }
            }
        }
    }
    
    struct NameEditView: View {
        @State var starting_name: String
        @Binding var playerName: String
        @Binding var isEditingName: Bool
        @FocusState private var isTextFieldFocused: Bool
        var onCommit: () -> Void
        
        func cleanup() {
            //        if playerName.count > 10 {
            //            let index = playerName.index(playerName.startIndex, offsetBy: 15)
            //            playerName = String(playerName[..<index]) + "..."
            //        }
            if playerName.replacingOccurrences(of: " ", with: "") == "" {
                playerName = starting_name
            }
            return
        }
        
        var body: some View {
            
            VStack {
                Text("Change Name")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                Text("Change your player name")
                ZStack {
                    RoundedRectangle(cornerRadius: 25.0)
                        .frame(height: 50)
                        .foregroundColor(Color(red: 69, green: 69, blue: 69))
                        .overlay(
                            RoundedRectangle(cornerRadius: 25.0)
                                .stroke(Color.red, lineWidth: 5)
                        )
                    TextField("Enter name", text: $playerName, onCommit: {
                        isEditingName = false
                        cleanup()
                        onCommit()
                        
                        
                    })
                    //.textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                    .foregroundColor(.gray)
                    .focused($isTextFieldFocused) // Bind the focus state to the text field
                    //.onAppear {
                    //isTextFieldFocused = true // Set the focus //when the view appears
                    //}
                }
                
                
                HStack {  // Button stack
                    Button { // Submit Button
                        isEditingName = false
                        cleanup()
                        onCommit()
                        
                        
                    } label: {
                        LargeKey(given_text: "Submit", color: .white, background: .red)
                    }
                    
                    Button {  // Cancel Button
                        playerName = starting_name
                        isEditingName = false
                    } label: {
                        LargeKey(given_text: "Cancel", color: .red, background: .white)
                    }
                }  // Button stack end
                
                .padding()
            }
            .padding()
        }
    }

#Preview {
    PlayerMenu(current_game: ActiveGame(player_count: 4, starting_life: 40))
}
