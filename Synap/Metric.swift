//
//  Unit.swift
//  Synap
//
//  Created by Eric Klaesson on 2/5/25.
//

import Foundation

struct Metric : Codable, Hashable {
//    case volume, mass, distance, currency, time, units, multiple choice (enums)

    var metric: String
    var unit: String
    var unitIncrement: Decimal
    
    init(metric: String, unit: String, unitIncrement: Decimal) {
        self.metric = metric
        self.unit = unit
        self.unitIncrement = unitIncrement
    }
    
    static func metricCount(unit: String = "time", unitIncrement: Decimal = 1) -> Metric {
        return Metric(metric: "count", unit: unit, unitIncrement: unitIncrement)
    }
    
    static func metricVolume(unit: String = "ml", unitIncrement: Decimal = 10) -> Metric {
        return Metric(metric: "volume", unit: unit, unitIncrement: unitIncrement)
    }
}
