//
//  Todo.swift
//  Synap
//
//  Created by Eric Klaesson on 17/4/25.
//

import Foundation
import SwiftData

@Model
final class Todo {
    var creationDate: Date
    var title: String
    var isDone: Bool
    var priority: Int
    
    @Attribute(.externalStorage)
    var image: Data?
    
    //@Attribute(.unique) // makes a field unique
    
    init(title: String, priority: Int = 0) {
        self.creationDate = Date()
        self.title = title
        self.isDone = false
        self.priority = priority
    }
}
