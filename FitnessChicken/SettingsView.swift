//
//  SettingsView.swift
//   FitnessChicken
//
//  Created by Laurence Sy on 8/23/23.
//


import SwiftUI

struct SettingsView: View {
    var body: some View {
        VStack {
            Text("Settings")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding()
        }
        .padding([.top, .bottom], 50)
    }
}

#Preview {
    SettingsView()
}
