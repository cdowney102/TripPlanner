//
//  AddActivityController.swift
//  TravelPlanner
//
//  Created by christopher downey on 5/2/19.
//  Copyright © 2019 christopher downey. All rights reserved.
//

import UIKit

class AddActivityController: UIViewController {
    
    weak var coordinator: AddActivityCoordinator?
    var dataManager: DataManager
    var trip: Trip!
    
    init(dataManager: DataManager) {
        self.dataManager = dataManager
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()

        let addActivityView = AddActivityView(frame: view.frame)
        view.addSubview(addActivityView)
    }
}
