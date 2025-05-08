//
//  Entry.swift
//  Synap
//
//  Created by Eric Klaesson on 2/5/25.
//

import Foundation
import SwiftData

@Model
final class Entry {
    
    var amount: Decimal
    var tracker: Tracker
    var createdAt : Date = Date()
    
    init(tracker: Tracker, amount: Decimal) {
        self.tracker = tracker
        self.amount = amount
    }
}
