//
//  FitnessChicken.swift
//
//  Created by Laurence Sy on 8/15/23.
//

import SwiftUI
import SwiftData

@main
struct FitnessChickenApp: App {

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: EntryItem.self)
    }
}
