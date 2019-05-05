//
//  CreateController.swift
//  TravelPlanner
//
//  Created by christopher downey on 4/29/19.
//  Copyright © 2019 christopher downey. All rights reserved.
//

import UIKit

class AddTripController: UIViewController {
    
    deinit {
        print("create gonce")
    }

    weak var coordinator: AddTripCoordinator?
    private var trip: Trip?
    
    override func loadView() {
        super.loadView()

        let addView = AddTripView(frame: view.frame)
        view.addSubview(addView)
        
        addView.header.backBtnAction = { [ weak self ] in
            self?.coordinator?.didCancel()
        }
        
    }
}
