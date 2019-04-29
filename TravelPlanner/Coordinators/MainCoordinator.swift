//
//  MainCoordinator.swift
//  TravelPlanner
//
//  Created by christopher downey on 4/28/19.
//  Copyright © 2019 christopher downey. All rights reserved.
//

import Foundation
import UIKit

class MainCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.navigationController.setNavigationBarHidden(true, animated: false)
    }
    
    func start() {
        #warning("grab data from DBManager and pass it -- may be empty")
        let vc = HomeController()
        vc.mainCoordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
}
