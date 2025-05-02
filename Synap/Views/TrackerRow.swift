//
//  TodoRow.swift
//  Synap
//
//  Created by Eric Klaesson on 28/4/25.
//

import SwiftUI

struct TrackerRow: View {
    @Bindable var tracker: Tracker
    
    var body: some View {
        HStack {
            ProgressIncrementor(tracker: tracker)
            
            VStack(alignment: .leading) {
                Text("\(tracker.title): \(tracker.counter)/\(tracker.goal)")
                Text(tracker.creationDate, format: Date.FormatStyle(date: .numeric, time: .standard))
            }
        }
    }
}

#Preview {
    var tracker = Tracker(title: "Title")
    tracker.counter = 0
    tracker.goal = 2
    
    return TrackerRow(tracker: tracker)
}
