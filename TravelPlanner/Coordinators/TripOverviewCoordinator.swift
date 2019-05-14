//
//  UpdateCoordinator.swift
//  TravelPlanner
//
//  Created by christopher downey on 5/1/19.
//  Copyright © 2019 christopher downey. All rights reserved.
//

import Foundation
import UIKit

class TripOverviewCoordinator: Coordinator {
    
    weak var parentCoordinator: MainCoordinator?
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    var dataManager: DataManager
    
    var trip: Trip!
    
    init(navigationController: UINavigationController, dataManager: DataManager) {
        self.dataManager = dataManager
        self.navigationController = navigationController
        self.navigationController.setNavigationBarHidden(true, animated: false)
    }
    
    func start() {
        let vc = TripOverviewController(dataManager: dataManager)
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
    
    func childDidfinish(_ child: Coordinator) {
        for (index, coordinator) in childCoordinators.enumerated() {
            if coordinator === child {
                childCoordinators.remove(at: index)
                break
            }
        }
        navigationController.popViewController(animated: true)
    }
    
    func editActivity(at index: Int) {
        let child = EditActivityCoordinator(navigationController: navigationController, dataManager: dataManager)
        child.parentCoordinator = self
        child.trip = trip
        child.activityAtIndex = index
        childCoordinators.append(child)
        child.start()
    }
    
    func addActivity() {
        let child = AddActivityCoordinator(navigationController: navigationController, dataManager: dataManager)
        child.parentCoordinator = self
        child.trip = trip
        childCoordinators.append(child)
        child.start()
    }
}
