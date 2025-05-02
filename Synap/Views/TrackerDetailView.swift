//
//  TodoDetailView.swift
//  Synap
//
//  Created by Eric Klaesson on 28/4/25.
//

import SwiftUI

struct TrackerDetailView: View {
    @Bindable var tracker: Tracker
    
    var body: some View {
        VStack {
            TextField("New Tracker", text: $tracker.title)
            ProgressIndicator(progress: tracker.progress)
        }
        .padding()
    }
}

#Preview {
    var tracker = Tracker(title: "Title")
    tracker.goal = 2
    tracker.counter = 1
    return TrackerDetailView(tracker: tracker)
}
