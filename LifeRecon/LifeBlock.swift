//
//  LifeBlock.swift
//  LifeRecon
//
//  Created by Michael Stang on 4/9/24.
//

import SwiftUI

struct LifeBlock: View {
    var block_color: Color
    @ObservedObject var player: Player
    @State private var showing_alert = false
    @State private var user_input = ""
    var body: some View {
        ZStack (content: {
            HStack (spacing: 0.0, content: {
                Button {
                    player.life_total = player.life_total - 1
                    player.life_total = player.life_total
                } label: {
                    Rectangle()
                        .padding(.all, 0.0)
                        .foregroundColor(block_color)
                }

                Button {
                    player.life_total = player.life_total + 1
                    player.life_total = player.life_total
                } label: {
                    Rectangle()
                        .padding(.all, 0.0)
                        .foregroundColor(block_color)
                }
                
            })
           
            Text(String(player.life_total))
                .font(.system(size: 80))
                .fontWeight(.bold)
                .foregroundColor(Color.white)
                .padding(.horizontal)
                .rotationEffect(Angle(degrees: 90))
                .gesture(LongPressGesture(minimumDuration: 0.3).onEnded { _ in
                    self.user_input = ""
                    self.showing_alert = true
                })
                .alert("Enter Number", isPresented: $showing_alert, actions: {
                    
                    TextField("Number", text: $user_input)
                        .keyboardType(.numberPad)
                    Button("OK") {
                        // Handle the user input here
                        if user_input.starts(with: "+") || user_input.starts(with: "-") {
                            if let life_total = Int(user_input) {
                                player.life_total = player.life_total + life_total
                            }
                        } else if user_input.starts(with: "x") || user_input.starts(with: "*") {
                            user_input.removeFirst()
                            if let life_total = Int(user_input) {
                                player.life_total = player.life_total * life_total
                            }
                        } else if let life_total = Int(user_input) {
                            player.life_total = life_total
                        }
                    }
                }, message: {
                    Text("Please enter a number.")
                })

            
        })
    }
}

#Preview {
    LifeBlock(block_color: .red, player: Player(life_total: 30))
}
