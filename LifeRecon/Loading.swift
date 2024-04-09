//
//  Loading.swift
//  LifeRecon
//
//  Created by Michael Stang on 4/9/24.
//

import SwiftUI

struct Loading: View {
    var body: some View {
        HStack {
            Text("LifeRecon by")
                .font(.headline)
                .multilineTextAlignment(.center)
            Spacer()
                .frame(width: 10.0)
            Image("ReconLogo")
                .resizable(resizingMode: .stretch)
                .aspectRatio(contentMode: .fit)
                .frame(width: 100.0, height: 100.0)
                .foregroundStyle(.tint)
            
        }
    }
}

#Preview {
    Loading()
}
