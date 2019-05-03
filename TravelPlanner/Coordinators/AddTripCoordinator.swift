//
//  CreateCoordinator.swift
//  TravelPlanner
//
//  Created by christopher downey on 4/29/19.
//  Copyright © 2019 christopher downey. All rights reserved.
//

import Foundation
import UIKit

class AddTripCoordinator: Coordinator {
    
    weak var parentCoordinator: MainCoordinator?
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.navigationController.setNavigationBarHidden(true, animated: false)
    }
    
    func start() {
        let vc = AddTripController()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
    func didFinishCreating(trip: Trip) {
        parentCoordinator?.childDidfinish(self)
    }
    
    func didCancel() {
        parentCoordinator?.childDidfinish(self)
    }
}
