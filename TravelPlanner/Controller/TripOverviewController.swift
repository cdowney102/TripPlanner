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
    lazy var tripOverviewView = TripOverviewView(frame: view.frame)
    var dataManager: DataManager
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
        tripOverviewView.header.estimatedCostLabel.text = trip.estimatedCost
        tripOverviewView.tableView.reloadData()
    }
    
    override func loadView() {
        super.loadView()
        setupUI()
    }
}

// MARK - UI setup
extension TripOverviewController {
    private func setupUI() {
        var subtitle = ""
        // nickname is optional so check for it
        if trip.tripName == "" {
            subtitle = "(\(trip.destination))"
        } else {
            subtitle = trip.tripName
        }
        
        view.addSubview(tripOverviewView)
        
        tripOverviewView.header.setupUI(destination: trip.destination, tripName: subtitle, estCost: trip.estimatedCost, btnType: .remove, color: .pastelOrange)
        
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
        
        tripOverviewView.header.btnAction = { [ weak self ] in
            guard let strongSelf = self else { return }
            strongSelf.dataManager.didDelete(trip: strongSelf.trip)
            strongSelf.coordinator?.didCancel()
        }
    }
}

// MARK - status bar color
extension TripOverviewController {
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}
