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
        VStack(alignment: .leading) {
            TextField("New Tracker", text: $tracker.title)
            Text("Goal: \(tracker.goal?.toString() ?? "")")
            ProgressIndicator(progress: tracker.goal?.progress ?? 0)
        }
        .padding()
    }
}

#Preview {
    var tracker = Tracker(title: "Title")
    return TrackerDetailView(tracker: tracker)
}
