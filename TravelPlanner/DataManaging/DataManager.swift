//
//  DataManager.swift
//  TravelPlanner
//
//  Created by christopher downey on 5/8/19.
//  Copyright © 2019 christopher downey. All rights reserved.
//

import Foundation

class DataManager: TripEditor {
    var trips: [String : Trip]
    var selectedTrip: Trip?
    
    init(trips: [String:Trip]) {
        self.trips = trips
    }
    
    func fetch(trip: Trip) -> Trip? {
        return trips[trip.id]
    }
    
    func fetchActivityFrom(index: Int, and trip: Trip) -> Activity? {
        return trips[trip.id]?.activities[index]
    }
}
