//
//  Utilities.swift
//  Synap
//
//  Created by Eric Klaesson on 7/5/25.
//

import Foundation

extension Date {
    
    func startOf(frequency: Repeater.Frequency) -> Date {
        switch(frequency) {
        case .hour: return Date().startOfHour()
        case .day: return Date().startOfDay()
        case .week: return Date().startOfWeek()
        case .month: return Date().startOfMonth()
        case .year: return Date().startOfYear()
        default: return Date()
        }
    }

    func startOfHour() -> Date {
        let calendar = Calendar.current

        var components = calendar.dateComponents([.year, .month, .day, .hour, .minute, .second], from: self)

        components.minute = 0
        components.second = 0

        return calendar.date(from: components)!
    }
    
    func startOfDay() -> Date {
        return Calendar.current.startOfDay(for: Date())
    }
    
    func startOfWeek() -> Date {
        let calendar = Calendar.current
        
        let firstWeekDay = calendar.firstWeekday
        let currentWeekDay = Calendar.current.component(.weekday, from: Date())

        var components = calendar.dateComponents([.year, .month, .day, .hour, .minute, .second], from: self)

        components.day! -= (currentWeekDay - firstWeekDay)
        components.hour = 0
        components.minute = 0
        components.second = 0

        return calendar.date(from: components)!
    }
    
    func startOfMonth() -> Date {
        let calendar = Calendar.current
        
        var components = calendar.dateComponents([.year, .month, .day, .hour, .minute, .second], from: self)

        components.day = 1
        components.hour = 0
        components.minute = 0
        components.second = 0

        return calendar.date(from: components)!
    }
    
    func startOfYear() -> Date {
        let calendar = Calendar.current
        
        var components = calendar.dateComponents([.year, .month, .day, .hour, .minute, .second], from: self)

        components.month = 1
        components.day = 1
        components.hour = 0
        components.minute = 0
        components.second = 0

        return calendar.date(from: components)!
    }
    
    func addYears(years: Int) -> Date {
        return Date().advanced(by: 3600*24*365*Double(years))
    }
}
