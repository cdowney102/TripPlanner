//
//  MainCoordinator.swift
//  TravelPlanner
//
//  Created by christopher downey on 4/28/19.
//  Copyright © 2019 christopher downey. All rights reserved.
//

import Foundation
import UIKit

class MainCoordinator: NSObject, Coordinator, UINavigationControllerDelegate {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    var dataManager: DataManager
    
    init(navigationController: UINavigationController, dataManager: DataManager) {
        self.dataManager = dataManager
        self.navigationController = navigationController
        self.navigationController.setNavigationBarHidden(true, animated: false)
    }
    
    func start() {
        navigationController.delegate = self
        let vc = HomeController(dataManager: dataManager)
        vc.mainCoordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
    func create() {
        let child = AddTripCoordinator(navigationController: navigationController, dataManager: dataManager)
        child.parentCoordinator = self
        childCoordinators.append(child)
        child.start()
    }
    
    func overview(_ trip: Trip) {
        let child = TripOverviewCoordinator(navigationController: navigationController, dataManager: dataManager)
        child.parentCoordinator = self
        child.trip = trip
        childCoordinators.append(child)
        child.start()
    }
    
    func refresh() {
        
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

