//
//  UpdateController.swift
//  TravelPlanner
//
//  Created by christopher downey on 5/1/19.
//  Copyright © 2019 christopher downey. All rights reserved.
//

import UIKit

class TripOverviewController: UIViewController {
    
    weak var coordinator: TripOverviewCoordinator?
    
    var trip: Trip!

    override func loadView() {
        super.loadView()

        let tripOverviewView = TripOverviewView(frame: view.frame)
        tripOverviewView.header.buttonType = .remove
        view.addSubview(tripOverviewView)
        
        tripOverviewView.didSelectTripAt = { index in
            self.coordinator?.editActivity(index)
        }
        
        tripOverviewView.addBtnAction = {
            self.coordinator?.addActivity()
        }
    }
}

