//
//  Trip.swift
//  TravelPlanner
//
//  Created by christopher downey on 4/29/19.
//  Copyright © 2019 christopher downey. All rights reserved.
//

import Foundation
import UIKit

struct Trip: Codable {
    var id: String
    var startDate: String
    var endDate: String
    var destination: String
    var tripName: String
    var activities: [Activity]
    var estimatedCost: String {
        let cost = activities.map { Int($0.estimatedCost.replacingOccurrences(of: "$", with: "")) ?? 0 }.reduce(0, +)
        return "$\(String(describing: cost))"
    }
}
