//
//  File.swift
//  Synap
//
//  Created by Eric Klaesson on 3/5/25.
//

import Foundation
import SwiftData

@Model
final class Repeater {
    
    enum Frequency : Int, Codable {
        case once, hour, day, week, month, year
    }
    
    var amount: Decimal = 1
    var frequency: Frequency = Frequency.once
    var triggerTimes: [TriggerTime] = []
    var startDate : Date
    var endDate : Date
    
    init(amount: Decimal = 1, frequency: Frequency = .once, startDate: Date = Date(), endDate: Date = Date().addYears(years: 1)) {
        self.amount = amount
        self.frequency = frequency
        self.startDate = startDate
        self.endDate = endDate
        
        if(self.amount < 1) {
            self.amount = 1
        }
        
        if(self.endDate < self.startDate) {
            self.endDate = self.startDate.advanced(by: 3600*24)
        }
    }
    
    func toString() -> String {
        var repeaterString = amount < 2 ? "time" : "times"
        
        repeaterString = "\(amount) \(repeaterString)"
        
        if(frequency != .once) {
            repeaterString += " per \(frequency)"
        }
        
        repeaterString += ", from \(startDate) to \(endDate)"
        
        return repeaterString
    }
}
