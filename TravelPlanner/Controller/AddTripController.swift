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
    var dataManager: DataManager
    var addView: AddTripView!
    private var trip: Trip?

    init(dataManager: DataManager) {
        self.dataManager = dataManager
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()

        addView = AddTripView(frame: view.frame)
        view.addSubview(addView!)
        
        addView.header.backBtnAction = { [ weak self ] in
            self?.coordinator?.didCancel()
        }
        
        addView.addTripBtnAction = { [ weak self ] in
            #warning("make sure this is consistent - strong self vs jsut self?")
            guard let strongSelf = self else { return }
            let trip = Trip(id: UUID().uuidString, startDate: strongSelf.addView.startDate, endDate: strongSelf.addView.endDate, destination: strongSelf.addView.destination, tripName: strongSelf.addView.nickname, activities: [])
            let validator = TextValidator()
            do {
                try validator.validate(input: trip.destination, fieldType: .destination)
                try validator.validate(input: trip.startDate, fieldType: .startDate)
                try validator.validate(input: trip.endDate, fieldType: .endDate)
            } catch {
                print(error.localizedDescription)
                return
            }
            strongSelf.dataManager.didCreate(trip: trip)
            strongSelf.coordinator?.didFinishCreating()
        }
        
        addView.header.btnAction = { [ weak self ] in
            guard let strongSelf = self else { return }
            strongSelf.coordinator?.didCancel()
        }
    }
}
