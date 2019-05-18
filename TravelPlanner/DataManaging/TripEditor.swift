//
//  TripEditor.swift
//  TravelPlanner
//
//  Created by christopher downey on 5/8/19.
//  Copyright © 2019 christopher downey. All rights reserved.
//

import Foundation

protocol TripEditor {
    var trips: [String:Trip] { get set }
    var hasChanges: Bool { get set }
    
    mutating func didCreate(trip: Trip)
    mutating func didDelete(trip: Trip)
    mutating func didCreateActivity(for trip: Trip, activity: Activity)
    mutating func didDeleteActivity(from trip: Trip, activity: Activity)
    mutating func didEditActivity(for trip: Trip, activity: Activity)
}

// MARK - implementation
extension TripEditor {
    mutating func didCreate(trip: Trip) {
        trips[trip.id] = trip
        hasChanges = true
    }
    
    mutating func didDelete(trip: Trip) {
        trips.removeValue(forKey: trip.id)
        hasChanges = true
    }
    
    mutating func didCreateActivity(for trip: Trip, activity: Activity) {
        trips[trip.id]?.activities.append(activity)
        hasChanges = true
    }
    
    mutating func didDeleteActivity(from trip: Trip, activity: Activity) {
        let filteredList = trips[trip.id]?.activities.filter { $0 != activity } ?? []
        trips[trip.id]?.activities = filteredList
        hasChanges = true
    }

    mutating func didEditActivity(for trip: Trip, activity: Activity) {
        if let activityList = trips[trip.id]?.activities {
            var foundIndex: Int? = nil
            for (index, item) in activityList.enumerated() {
                if item == activity {
                    foundIndex = index
                }
            }
            if let index = foundIndex {
                trips[trip.id]?.activities[index] = activity
            }
        }
        hasChanges = true
    }
}
