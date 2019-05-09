//
//  EditCoordinator.swift
//  TravelPlanner
//
//  Created by christopher downey on 5/2/19.
//  Copyright © 2019 christopher downey. All rights reserved.
//

import Foundation
import UIKit

class EditActivityCoordinator: Coordinator {
    
    weak var parentCoordinator: TripOverviewCoordinator?
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    var dataManager: DataManager
    var trip: Trip!
    var activityAtIndex: Int!
    
    init(navigationController: UINavigationController, dataManager: DataManager) {
        self.dataManager = dataManager
        self.navigationController = navigationController
        self.navigationController.setNavigationBarHidden(true, animated: false)
    }
    
    func start() {
        let vc = EditActivityController(dataManager: dataManager)
        vc.coordinator = self
        vc.trip = trip
        vc.activityAtIndex = activityAtIndex
        navigationController.pushViewController(vc, animated: true)
    }
    
    func activityWasUpdated() {
        parentCoordinator?.childDidfinish(self)
    }
    
    func didCancel() {
        parentCoordinator?.childDidfinish(self)
    }
    
    func childDidfinish(_ child: Coordinator) {
        for (index, coordinator) in childCoordinators.enumerated() {
            if coordinator === child {
                childCoordinators.remove(at: index)
                break
            }
        }
        navigationController.popViewController(animated: true)
    }
}
