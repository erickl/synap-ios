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
                Text(tracker.title)
                let progress = tracker.goal?.progress ?? 0
                if(progress != 0) {
                    Text("Progress: \(progress)")
                }
                Text(tracker.creationDate, format: Date.FormatStyle(date: .numeric, time: .standard))
            }
        }
    }
}

#Preview {
    var tracker = Tracker(title: "Title")    
    return TrackerRow(tracker: tracker)
}
