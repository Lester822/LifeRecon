//
//  AppSettingsPage.swift
//  LifeRecon
//
//  Created by Michael Stang on 12/31/24.
//

import SwiftUI

struct AppSettingsPage: View {
    @Binding var showing_app_settings: Bool
    var onCommit: () -> Void
    
    func cleanup() {
        return
    }
    
    var body: some View {
        
        VStack {
            Text("LifeRecon Settings")
                .font(.largeTitle)
                .fontWeight(.heavy)
            
            Spacer()
                .frame(height: UIScreen.main.bounds.height * 0.05)
            
//            Text("Player Name")
//                .fontWeight(.heavy)
            

        }
        .padding()
    }
}
