//
//  CreateController.swift
//  TravelPlanner
//
//  Created by christopher downey on 4/29/19.
//  Copyright © 2019 christopher downey. All rights reserved.
//

import UIKit

class AddTripController: UIViewController {

    weak var coordinator: AddTripCoordinator?
    private var trip: Trip?
    
    override func loadView() {
        super.loadView()

        let addView = AddTripView(frame: view.frame)
        view.addSubview(addView)
        
        addView.header.backBtnAction = { [ weak self ] in
            self?.coordinator?.didCancel()
        }
        
        addView.addTripBtnAction = { [ weak self ] in
            print("add trip")
            let trip = Trip(id: UUID().uuidString, startDate: "Sept 9, 2019", endDate: "Sept 11, 2019", destination: "San Diego", tripName: "LA Trip", activities: [])
            self?.coordinator?.didFinishCreating(trip: trip)
        }
    }
}
