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
            tracker.increment()
        }) {
            ProgressIndicator(progress: tracker.progress)
        }
        .buttonStyle(.plain)  // Removes any extra button styling
    }
}

#Preview {
    var tracker = Tracker(title: "New Task")
    tracker.counter = 1
    tracker.goal = 2
    return ProgressIncrementor(tracker: tracker)
}
