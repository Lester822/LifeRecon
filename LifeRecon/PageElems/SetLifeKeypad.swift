//
//  SetLifeKeypad.swift
//  LifeRecon
//
//  Created by Michael Stang on 4/10/24.
//

import SwiftUI

struct SetLifeKeypad: View {
    @State var current_text: String
    @State private var current_operation = "="
    @ObservedObject var current_game: ActiveGame
    
    private let operations = ["=", "+", "-"]
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
                    HStack {
                        ZStack {
                            UnevenRoundedRectangle(cornerRadii: .init(
                                topLeading: 25.0,
                                bottomLeading: 25.0,
                                bottomTrailing: 0.0,
                                topTrailing: 0.0),
                                                   style: .continuous)
                            .padding(0.0)
                            .frame(width:50, height: 60)
                            .foregroundColor(Color(hue: 1.0, saturation: 0.0, brightness: 0.835))
                            Text(current_operation)
                                .font(.largeTitle)
                                .minimumScaleFactor(0.1)
                                .bold()
                                .foregroundColor(.black)
                                .gesture(DragGesture().onEnded { gesture in
                                    let verticalMovement = gesture.translation.height
                                    if current_operation == "=" {
                                        if verticalMovement > 0 {
                                            current_operation = "+"
                                        } else {
                                            current_operation = "-"
                                        }
                                        
                                    } else if current_operation == "+" {
                                        if verticalMovement > 0 {
                                            current_operation = "-"
                                        } else {
                                            current_operation = "="
                                        }
                                        
                                    } else if current_operation == "-" {
                                        if verticalMovement > 0 {
                                            current_operation = "="
                                        } else {
                                            current_operation = "+"
                                        }
                                        
                                    }
                                                })
                        }
                        
                        
                        ZStack {
                            UnevenRoundedRectangle(cornerRadii: .init(
                                topLeading: 0.0,
                                bottomLeading: 0.0,
                                bottomTrailing: 25.0,
                                topTrailing: 25.0),
                                                   style: .continuous)
                            .frame(width:200, height: 60)
                            .foregroundColor(Color(hue: 1.0, saturation: 0.0, brightness: 0.835))
                            
                            .padding(.all, 0.0)
                            .foregroundColor(Color(hue: 1.0, saturation: 0.0, brightness: 0.835))
                            Text(current_text)
                                .font(.largeTitle)
                                .minimumScaleFactor(0.1)
                                .bold()
                                .foregroundColor(.black)
                        }
                        
//                        RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
//                            .frame(width:275, height: 60)
//                            .foregroundColor(Color(hue: 1.0, saturation: 0.0, brightness: 0.835))
                    }
                    
                    
                    
                })
                Spacer()
                    .frame(height: 20.0)
                HStack(content: {
                    //Spacer()
                        //.frame(width: 60.0)
                    VStack(content: {
                        Button {
                            haptic_pulse()
                            if current_text.count < 8 {
                                current_text = current_text + "1"
                            }
                        } label: {
                            KeypadKey(given_text: "1", color: .black, background: Color(hue: 1.0, saturation: 0.0, brightness: 0.835))
                        }
                        Button {
                            haptic_pulse()
                            if current_text.count < 8 {
                                current_text = current_text + "4"
                            }
                        } label: {
                            KeypadKey(given_text: "4", color: .black, background: Color(hue: 1.0, saturation: 0.0, brightness: 0.835))
                        }
                        Button {
                            haptic_pulse()
                            if current_text.count < 8 {
                                current_text = current_text + "7"
                            }
                        } label: {
                            KeypadKey(given_text: "7", color: .black, background: Color(hue: 1.0, saturation: 0.0, brightness: 0.835))
                        }
                        Button {
                            haptic_pulse()
                            if current_text.count < 8 {
                                print("BLANK")
                            }
                        } label: {
                            BlankKey()
                        }
                    })
                    VStack(content: {
                        Button {
                            haptic_pulse()
                            if current_text.count < 8 {
                                current_text = current_text + "2"
                            }
                        } label: {
                            KeypadKey(given_text: "2", color: .black, background: Color(hue: 1.0, saturation: 0.0, brightness: 0.835))
                        }
                        Button {
                            haptic_pulse()
                            if current_text.count < 8 {
                                current_text = current_text + "5"
                            }
                        } label: {
                            KeypadKey(given_text: "5", color: .black, background: Color(hue: 1.0, saturation: 0.0, brightness: 0.835))
                        }
                        Button {
                            haptic_pulse()
                            if current_text.count < 8 {
                                current_text = current_text + "8"
                            }
                        } label: {
                            KeypadKey(given_text: "8", color: .black, background: Color(hue: 1.0, saturation: 0.0, brightness: 0.835))
                        }
                        Button {
                            haptic_pulse()
                            if current_text.count < 8 {
                                current_text = current_text + "0"
                            }
                        } label: {
                            KeypadKey(given_text: "0", color: .black, background: Color(hue: 1.0, saturation: 0.0, brightness: 0.835))
                        }
                    })
                    VStack(content: {
                        Button {
                            haptic_pulse()
                            if current_text.count < 8 {
                                current_text = current_text + "3"
                            }
                        } label: {
                            KeypadKey(given_text: "3", color: .black, background: Color(hue: 1.0, saturation: 0.0, brightness: 0.835))
                        }
                        Button {
                            haptic_pulse()
                            if current_text.count < 8 {
                                current_text = current_text + "6"
                            }
                        } label: {
                            KeypadKey(given_text: "6", color: .black, background: Color(hue: 1.0, saturation: 0.0, brightness: 0.835))
                        }
                        Button {
                            haptic_pulse()
                            if current_text.count < 8 {
                                current_text = current_text + "9"
                            }
                        } label: {
                            KeypadKey(given_text: "9", color: .black, background: Color(hue: 1.0, saturation: 0.0, brightness: 0.835))
                        }
                        Button {
                            haptic_pulse()
                            if current_text.count > 0 {
                                current_text.removeLast()
                            }
                        } label: {
                            KeypadKey(given_text: "←", color: .black, background: .white)
                        }
                        

                    })
//                    VStack (content: {
//                        Button {
//                            haptic_pulse()
//                            if current_text.count < 8 {
//                                current_text = current_text + "+"
//                            }
//                        } label: {
//                            KeypadKey(given_text: "+", color: .white, background: Color(hue: 1.0, saturation: 0.0, brightness: 0))
//                        }
//                        Button {
//                            haptic_pulse()
//                            if current_text.count < 8 {
//                                current_text = current_text + "-"
//                            }
//                        } label: {
//                            KeypadKey(given_text: "-", color: .white, background: Color(hue: 1.0, saturation: 0.0, brightness: 0))
//                        }
//                        Button {
//                            haptic_pulse()
//                            if current_text.count < 8 {
//                                current_text = current_text + "*"
//                            }
//                        } label: {
//                            KeypadKey(given_text: "x", color: .white, background: Color(hue: 1.0, saturation: 0.0, brightness: 0))
//                        }
//                    })
                    
                    
                })
//                Spacer()
//                    .frame(height: 30)
                VStack (content: {

                    HStack (content: {
                        Button {
                            haptic_pulse()
                            current_game.current_rotation = 0
                            withAnimation {
                                self.current_game.showing_keypad = false
                            }
                        } label: {
                            LargeKey(given_text: "Cancel", color: .black, background: Color(hue: 1.0, saturation: 0.0, brightness: 0.835))
                        }
                        .transition(.zoomIt)
                        Button {
                            haptic_pulse()
                            if current_operation == "+" {
                                if let given_number = Int(current_text) {
                                    self.current_game.caller.life_total = self.current_game.caller.life_total + given_number
                                } else {
                                    print("'\(current_text)' is not a valid integer.")
                                }

                            } else if current_operation == "-" {
                                if let given_number = Int(current_text) {
                                    self.current_game.caller.life_total = self.current_game.caller.life_total - given_number
                                } else {
                                    print("'\(current_text)' is not a valid integer.")
                                }
                            } else {
                                if let given_number = Int(current_text) {
                                    self.current_game.caller.life_total = given_number
                                } else {
                                    print("'\(current_text)' is not a valid integer.")
                                }
                            }
                            current_game.current_rotation = 0
                            withAnimation {
                                self.current_game.showing_keypad = false
                            }
                            
                            
                        } label: {
                            LargeKey(given_text: "Submit", color: .white, background: .green)
                        }
                    })


                })
                
                
                

                
                
            })
            

        
        })

               }}

func haptic_pulse() {
    let generator = UIImpactFeedbackGenerator(style: .medium)
    generator.prepare()
    generator.impactOccurred()
}
#Preview {
    SetLifeKeypad(current_text: "10", current_game: ActiveGame(player_count: 4, starting_life: 40))
}
