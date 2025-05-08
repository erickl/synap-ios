//
//  Todo.swift
//  Synap
//
//  Created by Eric Klaesson on 17/4/25.
//

import Foundation
import SwiftData

@Model
final class Tracker {
    var creationDate: Date = Date()
    var title: String
    var priority: Int = 0
    var runningTotal: Int = 0
    var isCompleted = false
    
    @Relationship(deleteRule: .cascade, inverse: \Goal.tracker)
    var goal : Goal? // todo: should I be able to have an array of goals? 
    
    @Relationship(deleteRule: .cascade, inverse: \Entry.tracker)
    var entries : [Entry] = []
    
    @Attribute(.externalStorage)
    var image: Data?
    
    init(title: String, priority: Int = 0) {
        self.title = title
        self.priority = priority
    }
    
    public func addEntry(amount: Decimal = 1) {
        entries.append(Entry(tracker: self, amount: amount))
        
        isCompleted = goal != nil ? goal!.isComplete() : true
    }
}
