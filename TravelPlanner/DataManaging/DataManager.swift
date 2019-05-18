//
//  DataManager.swift
//  TravelPlanner
//
//  Created by christopher downey on 5/8/19.
//  Copyright © 2019 christopher downey. All rights reserved.
//

import Foundation

final class DataManager: TripEditor {
    
    var trips: [String : Trip]
    var hasChanges: Bool
    
    var fileURL: URL {
        return URL(fileURLWithPath: NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!).appendingPathComponent("Trips.json")
    }
    
    init() {
        self.trips = [:]
        self.hasChanges = false
    }
    
    func fetch(trip: Trip) -> Trip? {
        return trips[trip.id]
    }
    
    func fetchActivityFrom(index: Int, and trip: Trip) -> Activity? {
        return trips[trip.id]?.activities[index]
    }
    
    func save() {
        if hasChanges {
            do {
                let data = try JSONEncoder().encode(trips)
                try data.write(to: fileURL)
            } catch {
                print("Problem saving trips: \(error)")
            }
        }
        hasChanges = false
    }
    
    func load() {
        do {
            let data = try Data(contentsOf: fileURL)
            let loadedTrips = try JSONDecoder().decode([String: Trip].self, from: data)
            trips = loadedTrips
        } catch {
            print("Problem loading trips: \(error)")
        }
    }
}
