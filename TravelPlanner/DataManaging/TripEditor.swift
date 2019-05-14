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
    var selectedTrip: Trip? { get set }
    
    mutating func didCreate(trip: Trip)
    mutating func didDelete(trip: Trip)
    mutating func didCreateActivity(for trip: Trip, activity: Activity)
    mutating func didDeleteActivity(from trip: Trip, activity: Activity)
    mutating func didEditActivity(for trip: Trip, activity: Activity)
}

extension TripEditor {
    mutating func didCreate(trip: Trip) {
        trips[trip.id] = trip
    }
    
    mutating func didDelete(trip: Trip) {
        #warning("maybe rethink passing around just the id or actualy trip ref here in all these calls")
        trips.removeValue(forKey: trip.id)
    }
    
    mutating func didCreateActivity(for trip: Trip, activity: Activity) {
        trips[trip.id]?.activities.append(activity)
    }
    
    mutating func didDeleteActivity(from trip: Trip, activity: Activity) {
        let filteredList = trips[trip.id]?.activities.filter { $0 != activity } ?? []
        trips[trip.id]?.activities = filteredList
    }

    mutating func didEditActivity(for trip: Trip, activity: Activity) {
        #warning("this is ugly")
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
    }
}