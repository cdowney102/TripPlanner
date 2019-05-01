//
//  UpdateController.swift
//  TravelPlanner
//
//  Created by christopher downey on 5/1/19.
//  Copyright © 2019 christopher downey. All rights reserved.
//

import UIKit

class UpdateController: UIViewController {
    
    weak var coordinator: UpdateCoordinator?
    
    var trip: Trip!

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .cyan
        print(trip)
    }
}
