//
//  AddActivityCoordinator.swift
//  TravelPlanner
//
//  Created by christopher downey on 5/2/19.
//  Copyright © 2019 christopher downey. All rights reserved.
//

import Foundation
import UIKit

class AddActivityCoordinator: Coordinator {
    
    weak var parentCoordinator: TripOverviewCoordinator?
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
        let vc = AddActivityController(dataManager: dataManager)
        vc.coordinator = self
        vc.trip = trip
        navigationController.pushViewController(vc, animated: true)
    }
    
    func activityWasAdded() {
        parentCoordinator?.childDidfinish(self)
    }
    
    func didCancel() {
        parentCoordinator?.childDidfinish(self)
    }
}
