//
//  SetLifeKeypad.swift
//  LifeRecon
//
//  Created by Michael Stang on 4/10/24.
//

import SwiftUI

struct SetLifeKeypad: View {
    @State var current_text: String
    var body: some View {
        ZStack(content: {
            RoundedRectangle(cornerRadius: 30.0)
                .frame(width: 305.0, height: 465.0)
                .foregroundColor(.black)
            RoundedRectangle(cornerRadius: 30.0)
                .frame(width: 300.0, height: 460.0)
                .foregroundColor(.white)
            VStack(content: {
                ZStack (content: {
                    RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                        .frame(width:285, height: 65)
                    RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                        .frame(width:280, height: 60)
                        .foregroundColor(.white)
                    Text(current_text)
                        .font(.largeTitle)
                        .bold()
                })
                
                HStack(content: {
                    VStack(content: {
                        Button {
                            if current_text.count < 8 {
                                current_text = current_text + "1"
                            }
                        } label: {
                            KeypadKey(given_text: "1")
                        }
                        Button {
                            if current_text.count < 8 {
                                current_text = current_text + "4"
                            }
                        } label: {
                            KeypadKey(given_text: "4")
                        }
                        Button {
                            if current_text.count < 8 {
                                current_text = current_text + "7"
                            }
                        } label: {
                            KeypadKey(given_text: "7")
                        }
                        Button {
                            if current_text.count < 8 {
                                current_text = current_text + "+"
                            }
                        } label: {
                            KeypadKey(given_text: "+")
                        }
                        Button {
                            print("WOW")
                        } label: {
                            KeypadKey(given_text: "No")
                        }
                    })
                    VStack(content: {
                        Button {
                            if current_text.count < 8 {
                                current_text = current_text + "2"
                            }
                        } label: {
                            KeypadKey(given_text: "2")
                        }
                        Button {
                            if current_text.count < 8 {
                                current_text = current_text + "5"
                            }
                        } label: {
                            KeypadKey(given_text: "5")
                        }
                        Button {
                            if current_text.count < 8 {
                                current_text = current_text + "8"
                            }
                        } label: {
                            KeypadKey(given_text: "8")
                        }
                        Button {
                            if current_text.count < 8 {
                                current_text = current_text + "0"
                            }
                        } label: {
                            KeypadKey(given_text: "0")
                        }
                        Button {
                            print("WOW")
                        } label: {
                            KeypadKey(given_text: "Go")
                        }
                    })
                    VStack(content: {
                        Button {
                            if current_text.count < 8 {
                                current_text = current_text + "3"
                            }
                        } label: {
                            KeypadKey(given_text: "3")
                        }
                        Button {
                            if current_text.count < 8 {
                                current_text = current_text + "6"
                            }
                        } label: {
                            KeypadKey(given_text: "6")
                        }
                        Button {
                            if current_text.count < 8 {
                                current_text = current_text + "9"
                            }
                        } label: {
                            KeypadKey(given_text: "9")
                        }
                        Button {
                            if current_text.count < 8 {
                                current_text = current_text + "-"
                            }
                        } label: {
                            KeypadKey(given_text: "-")
                            
                        }
                        Button {
                            if current_text.count > 0 {
                                current_text.removeLast()
                            }
                        } label: {
                            KeypadKey(given_text: "←")
                        }
                    })
                })

                
                
            })

        
    })
               }}

#Preview {
    SetLifeKeypad(current_text: "10")
}
