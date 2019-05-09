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
    var dataManager: DataManager
    var trip: Trip!

    init(dataManager: DataManager) {
        self.dataManager = dataManager
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()

        let tripOverviewView = TripOverviewView(frame: view.frame)
        tripOverviewView.header.buttonType = .remove
        view.addSubview(tripOverviewView)
        
        tripOverviewView.didSelectTripAt = { [ weak self ] index in
            guard let strongSelf = self else { return }
            strongSelf.coordinator?.editActivity(index)
        }
        
        tripOverviewView.addBtnAction = { [ weak self ] in
            guard let strongSelf = self else { return }
            strongSelf.coordinator?.addActivity()
        }

        tripOverviewView.header.backBtnAction = { [ weak self ] in
            print("back")
            guard let strongSelf = self else { return }
            strongSelf.coordinator?.didCancel()
        }
    }
}

