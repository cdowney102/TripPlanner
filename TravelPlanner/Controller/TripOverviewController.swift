//
//  UpdateController.swift
//  TravelPlanner
//
//  Created by christopher downey on 5/1/19.
//  Copyright © 2019 christopher downey. All rights reserved.
//

// MARK - TripOverView lists activities for the selected trip

import UIKit

class TripOverviewController: UIViewController {
    
    weak var coordinator: TripOverviewCoordinator?
    var dataManager: DataManager
    var tripOverviewView: TripOverviewView!
    var trip: Trip!

    init(dataManager: DataManager) {
        self.dataManager = dataManager
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        trip = dataManager.fetch(trip: trip)
        tripOverviewView.dataSource.activities = trip.activities
        tripOverviewView.tableView.reloadData()
    }
    
    override func loadView() {
        super.loadView()
        
        tripOverviewView = TripOverviewView(frame: view.frame)
        tripOverviewView.header.setupUI(destination: trip.destination, tripName: trip.tripName, estCost: trip.estimatedCost, btnType: .add)
        view.addSubview(tripOverviewView)
        
        tripOverviewView.didSelectTripAt = { [ weak self ] index in
            guard let strongSelf = self else { return }
            strongSelf.coordinator?.editActivity(at: index)
        }
        
        tripOverviewView.addBtnAction = { [ weak self ] in
            guard let strongSelf = self else { return }
            strongSelf.coordinator?.addActivity()
        }

        tripOverviewView.header.backBtnAction = { [ weak self ] in
            guard let strongSelf = self else { return }
            strongSelf.coordinator?.didCancel()
        }
    }
}

