//
//  TodoToggle.swift
//  Synap
//
//  Created by Eric Klaesson on 28/4/25.
//

import SwiftUI

struct ProgressIncrementor: View {
    @Bindable var tracker: Tracker
        
    var body: some View {
        Button(action: {
            tracker.addEntry()
        }) {
            ProgressIndicator(progress: tracker.goal?.progress ?? 0)
        }
        .buttonStyle(.plain)  // Removes any extra button styling
    }
}

#Preview {
    var tracker = Tracker(title: "New Task")
    return ProgressIncrementor(tracker: tracker)
}
