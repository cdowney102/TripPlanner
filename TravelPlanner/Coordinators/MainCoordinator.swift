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
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.navigationController.setNavigationBarHidden(true, animated: false)
    }
    
    func start() {
        #warning("grab data from DBManager and pass it -- may be empty")
        navigationController.delegate = self
        let vc = HomeController()
        vc.mainCoordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
    func create() {
        let child = CreateCoordinator(navigationController: navigationController)
        child.parentCoordinator = self
        childCoordinators.append(child)
        child.start()
    }
    
    func update(_ trip: Trip) {
        let child = UpdateCoordinator(navigationController: navigationController)
        child.parentCoordinator = self
        child.trip = trip
        childCoordinators.append(child)
        child.start()
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

