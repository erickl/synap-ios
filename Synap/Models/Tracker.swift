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
    var counter: Int = 0
    var goal: Int = 1
    var isCompleted = false
    
    var progress: Double {
        Double(counter)/Double(goal)
    }
    
    @Attribute(.externalStorage)
    var image: Data?
    
    //@Attribute(.unique) // makes a field unique
    
    init(title: String, priority: Int = 0) {
        self.title = title
        self.priority = priority
    }
    
    func increment() {
        counter += 1
        
        isCompleted = calculateIfCompleted()
    }
    
    private func calculateIfCompleted() -> Bool {
        return counter >= goal
    }
}
