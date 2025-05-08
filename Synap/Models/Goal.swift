//
//  File.swift
//  Synap
//
//  Created by Eric Klaesson on 2/5/25.
//

import Foundation
import SwiftData

@Model
final class Goal {
    
    enum Direction: Int, Codable {
        case none, min, max
    }
    
    var tracker : Tracker
    var metric: Metric
    var repeater : Repeater
    var direction : Direction
    
    init(tracker: Tracker, metric: Metric, repeater: Repeater, direction: Direction) {
        self.tracker = tracker
        self.metric = metric
        self.repeater = repeater
        self.direction = direction
    }
    
    func relevantEntries() -> [Entry] {
        if(repeater.frequency == .once) {
            if let last = tracker.entries.last { return [last] }
            else { return [] }
        }
        
        let cutOff = Date().startOf(frequency: repeater.frequency)
        let startIndex = entriesNewerThan(cutoff: cutOff)
        
        return Array(tracker.entries[startIndex...])
    }
    
    var runningTotal: Decimal {
        return relevantEntries().reduce(Decimal(0)) { runningTotal, entry in
            return runningTotal + entry.amount
        }
    }
    
    var progress: Decimal {
        return runningTotal/repeater.amount
    }
    
    func isComplete() -> Bool {
        // Only complete if max hasn't been reached by the end of the time period
        if(direction == .max) {
            // todo
        } else if(direction == .min) {
            return progress >= Decimal(1)
        }
        
        return progress >= Decimal(1)
    }
    
    func entriesNewerThan(cutoff: Date) -> Int {
        for i in tracker.entries.indices {
            if tracker.entries[i].createdAt < cutoff {
                return i
            }
        }
        return 0
    }
    
    static func defaultGoal(tracker: Tracker) -> Goal {
        Goal(
            tracker: tracker,
            metric: Metric.metricCount(),
            repeater: Repeater(amount: 1, frequency: .once),
            direction: .none)
    }
    
    func toString() -> String {
        "\(repeater.toString()), \(direction)"
    }
}
