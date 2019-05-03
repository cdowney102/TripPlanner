//
//  EditController.swift
//  TravelPlanner
//
//  Created by christopher downey on 5/2/19.
//  Copyright © 2019 christopher downey. All rights reserved.
//

import UIKit

class EditActivityController: UIViewController {

    weak var coordinator: EditActivityCoordinator?
    var trip: Trip!
    var activityAtIndex: Int!
    
    override func loadView() {
        super.loadView()
        
        let editView = EditActivityView(frame: view.frame)
        view.addSubview(editView)
        
    }
}
