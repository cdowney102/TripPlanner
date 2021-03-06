//
//  TripsDataSource.swift
//  TravelPlanner
//
//  Created by christopher downey on 5/1/19.
//  Copyright © 2019 christopher downey. All rights reserved.
//

import Foundation
import UIKit

class TripsDataSource: NSObject, UICollectionViewDataSource {
    
    var trips = [Trip]()
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return trips.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var name = ""
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TripCell.identifier, for: indexPath) as! TripCell
        let trip = trips[indexPath.item]
        // trip nickname is optional so if its empty display the trip destination
        if trip.tripName == "" {
            name = trip.destination
        } else {
            name = trip.tripName
        }
        cell.setLabelText(tripName: name, date: trip.startDate, tripCost: trip.estimatedCost)
        return cell
    }
    
    func fetchTripAtIndex(_ index: Int) -> Trip {
        return trips[index]
    }
}

