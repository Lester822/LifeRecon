//
//  SetLifeKeypad.swift
//  LifeRecon
//
//  Created by Michael Stang on 4/10/24.
//

import SwiftUI

struct StartingLifekeypad: View {
    @State var current_text: String
    @ObservedObject var current_game: ActiveGame
    @State private var first_entry = true
    
    var body: some View {
        ZStack(content: {
            RoundedRectangle(cornerRadius: 30.0)
                .frame(width: 350.0, height: 350.0)
                .frame(width: 350.0, height: 350.0)
                .foregroundColor(.white)
                .opacity(0.97)
                .blur(radius: 1.0)
            VStack(content: {
                ZStack (content: {
                    RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                        .frame(width:275, height: 60)
                        .foregroundColor(Color(hue: 1.0, saturation: 0.0, brightness: 0.835))
                    Text(current_text)
                        .font(.largeTitle)
                        .minimumScaleFactor(0.1)
                        .bold()
                        .foregroundColor(.black)
                    
                })
                Spacer()
                    .frame(height: 20.0)
                HStack(content: {
                    //Spacer()
                        //.frame(width: 60.0)
                    VStack(content: {
                        Button {
                            medium_haptic_pulse()
                            if current_text.count < 8 {
                                if first_entry == true {
                                    current_text = ""
                                    first_entry = false
                                }
                                current_text = current_text + "1"
                            }
                        } label: {
                            Key_Keypad(given_text: "1", color: .black, background: Color(hue: 1.0, saturation: 0.0, brightness: 0.835))
                        }
                        .buttonStyle(JumpButton())
                        Button {
                            medium_haptic_pulse()
                            if first_entry == true {
                                current_text = ""
                                first_entry = false
                            }
                            if current_text.count < 8 {
                                current_text = current_text + "4"
                            }
                        } label: {
                            Key_Keypad(given_text: "4", color: .black, background: Color(hue: 1.0, saturation: 0.0, brightness: 0.835))
                        }
                        .buttonStyle(JumpButton())
                        Button {
                            medium_haptic_pulse()
                            if first_entry == true {
                                current_text = ""
                                first_entry = false
                            }
                            if current_text.count < 8 {
                                current_text = current_text + "7"
                            }
                        } label: {
                            Key_Keypad(given_text: "7", color: .black, background: Color(hue: 1.0, saturation: 0.0, brightness: 0.835))
                        }
                        .buttonStyle(JumpButton())
                        Button {
                            medium_haptic_pulse()
                            if current_text.count < 8 {
                                print("BLANK")
                            }
                        } label: {
                            Key_Blank()
                        }
                    })
                    VStack(content: {
                        Button {
                            medium_haptic_pulse()
                            if first_entry == true {
                                current_text = ""
                                first_entry = false
                            }
                            if current_text.count < 8 {
                                current_text = current_text + "2"
                            }
                        } label: {
                            Key_Keypad(given_text: "2", color: .black, background: Color(hue: 1.0, saturation: 0.0, brightness: 0.835))
                        }
                        .buttonStyle(JumpButton())
                        Button {
                            medium_haptic_pulse()
                            if first_entry == true {
                                current_text = ""
                                first_entry = false
                            }
                            if current_text.count < 8 {
                                current_text = current_text + "5"
                            }
                        } label: {
                            Key_Keypad(given_text: "5", color: .black, background: Color(hue: 1.0, saturation: 0.0, brightness: 0.835))
                        }
                        .buttonStyle(JumpButton())
                        Button {
                            medium_haptic_pulse()
                            if first_entry == true {
                                current_text = ""
                                first_entry = false
                            }
                            if current_text.count < 8 {
                                current_text = current_text + "8"
                            }
                        } label: {
                            Key_Keypad(given_text: "8", color: .black, background: Color(hue: 1.0, saturation: 0.0, brightness: 0.835))
                        }
                        .buttonStyle(JumpButton())
                        Button {
                            medium_haptic_pulse()
                            if first_entry == true {
                                current_text = ""
                                first_entry = false
                            }
                            if current_text.count < 8 {
                                current_text = current_text + "0"
                            }
                        } label: {
                            Key_Keypad(given_text: "0", color: .black, background: Color(hue: 1.0, saturation: 0.0, brightness: 0.835))
                        }
                        .buttonStyle(JumpButton())
                    })
                    VStack(content: {
                        Button {
                            medium_haptic_pulse()
                            if first_entry == true {
                                current_text = ""
                                first_entry = false
                            }
                            if current_text.count < 8 {
                                current_text = current_text + "3"
                            }
                        } label: {
                            Key_Keypad(given_text: "3", color: .black, background: Color(hue: 1.0, saturation: 0.0, brightness: 0.835))
                        }
                        .buttonStyle(JumpButton())
                        Button {
                            medium_haptic_pulse()
                            if first_entry == true {
                                current_text = ""
                                first_entry = false
                            }
                            if current_text.count < 8 {
                                current_text = current_text + "6"
                            }
                        } label: {
                            Key_Keypad(given_text: "6", color: .black, background: Color(hue: 1.0, saturation: 0.0, brightness: 0.835))
                        }
                        .buttonStyle(JumpButton())
                        Button {
                            medium_haptic_pulse()
                            if first_entry == true {
                                current_text = ""
                                first_entry = false
                            }
                            if current_text.count < 8 {
                                current_text = current_text + "9"
                            }
                        } label: {
                            Key_Keypad(given_text: "9", color: .black, background: Color(hue: 1.0, saturation: 0.0, brightness: 0.835))
                        }
                        .buttonStyle(JumpButton())
                        Button {
                            medium_haptic_pulse()
                            if current_text.count > 0 {
                                current_text.removeLast()
                            }
                        } label: {
                            Key_Keypad(given_text: "←", color: .black, background: .white)
                        }
                        .buttonStyle(JumpButton())
                    })
                })
//                Spacer()
//                    .frame(height: 30)
                VStack (content: {
                    HStack (content: {
                        Spacer()
                            .frame(width: 0.0, height: 50.0)
                        Button {
                            medium_haptic_pulse()
                            if let given_number = Int(current_text) {
                                self.current_game.starting_life = given_number
                                withAnimation {
                                    current_game.current_setting = "optional"
                                }
                                
                            }
                            
                        } label: {
                            Key_Large(given_text: "Submit", color: .white, background: .red)
                        }
                        .buttonStyle(JumpButton())
                    })
                })
            })
        })
    }}


#Preview {
    StartingLifekeypad(current_text: "10", current_game: ActiveGame(player_count: 4, starting_life: 40))
}
