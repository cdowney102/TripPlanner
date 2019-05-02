//
//  UpdateCoordinator.swift
//  TravelPlanner
//
//  Created by christopher downey on 5/1/19.
//  Copyright © 2019 christopher downey. All rights reserved.
//

import Foundation
import UIKit

class UpdateCoordinator: Coordinator {
    
    weak var parentCoordinator: MainCoordinator?
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    var trip: Trip!
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.navigationController.setNavigationBarHidden(true, animated: false)
    }
    
    func start() {
        let vc = UpdateController()
        vc.coordinator = self
        vc.trip = trip
        navigationController.pushViewController(vc, animated: true)
    }
    
    func didFinishCreating(trip: Trip) {
        parentCoordinator?.childDidfinish(self)
    }
    
    func didCancel() {
        parentCoordinator?.childDidfinish(self)
    }
    
    func editActivity(_ activityAtIndex: Int) {
        let child = EditCoordinator(navigationController: navigationController)
        child.parentCoordinator = self
        child.trip = trip
        child.activityAtIndex = activityAtIndex
        childCoordinators.append(child)
        child.start()
    }
}
