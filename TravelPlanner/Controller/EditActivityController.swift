//
//  EditController.swift
//  TravelPlanner
//
//  Created by christopher downey on 5/2/19.
//  Copyright © 2019 christopher downey. All rights reserved.
//

import UIKit

class EditActivityController: UIViewController {

    weak var coordinator: EditCoordinator?
    var trip: Trip!
    var activityAtIndex: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let editView = EditActivityView(frame: view.frame)
        view.addSubview(editView)
    }
}
