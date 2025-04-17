//
//  Item.swift
//  Synap
//
//  Created by Eric Klaesson on 17/4/25.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
