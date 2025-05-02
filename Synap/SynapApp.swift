//
//  SynapApp.swift
//  Synap
//
//  Created by Eric Klaesson on 17/4/25.
//

import SwiftUI
import SwiftData

@main
struct SynapApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Tracker.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(sharedModelContainer)
    }
}
