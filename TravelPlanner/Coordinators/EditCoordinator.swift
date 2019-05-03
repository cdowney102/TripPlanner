//
//  EditCoordinator.swift
//  TravelPlanner
//
//  Created by christopher downey on 5/2/19.
//  Copyright © 2019 christopher downey. All rights reserved.
//

import Foundation
import UIKit

class EditCoordinator: Coordinator {
    
    weak var parentCoordinator: UpdateCoordinator?
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    var trip: Trip!
    var activityAtIndex: Int!
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.navigationController.setNavigationBarHidden(true, animated: false)
    }
    
    func start() {
        let vc = EditActivityController()
        vc.coordinator = self
        vc.trip = trip
        vc.activityAtIndex = activityAtIndex
        navigationController.pushViewController(vc, animated: true)
    }
}
