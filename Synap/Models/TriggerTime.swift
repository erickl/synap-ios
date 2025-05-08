//
//  TriggerTime.swift
//  Synap
//
//  Created by Eric Klaesson on 3/5/25.
//

import Foundation
import SwiftData

@Model
final class TriggerTime {
    
    var day : Int = 1
    var hour : Int = 0
    var minute : Int = 0
    
    init(day: Int = 1, hour: Int = 0, minute: Int = 0) {
        self.day = day
        self.hour = hour
        self.minute = minute
    }
}
