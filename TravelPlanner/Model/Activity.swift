//
//  Activity.swift
//  TravelPlanner
//
//  Created by christopher downey on 5/1/19.
//  Copyright © 2019 christopher downey. All rights reserved.
//

import Foundation

struct Activity: Equatable {
    var id: String
    var name: String
    var estimatedCost: String
    
    static func ==(lhs: Activity, rhs: Activity) -> Bool {
        return lhs.id == rhs.id
    }
}
