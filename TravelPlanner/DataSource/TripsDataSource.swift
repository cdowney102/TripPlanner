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
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TripCell.identifier, for: indexPath) as! TripCell
        let trip = trips[indexPath.item]
        cell.setLabelText(tripName: trip.tripName, date: trip.startDate, tripCost: trip.estimatedCost)
        return cell
    }
    
    func fetchTripAtIndex(_ index: Int) -> Trip {
        return trips[index]
    }
}

