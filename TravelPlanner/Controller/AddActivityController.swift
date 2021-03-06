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
        setupUI()
    }
}

// MARK - UI setup
extension AddActivityController {
    private func setupUI() {
        let addActivityView = AddActivityView(frame: view.frame)
        
        view.addSubview(addActivityView)
        
        let validator = TextValidator()
        
        addActivityView.addBtnAction = { [ weak self ] in
            guard let strongSelf = self else { return }
            
            let activity = Activity(id: UUID().uuidString, name: addActivityView.name, estimatedCost: addActivityView.cost)
            
            do {
                try validator.validate(input: activity.name, fieldType: .destination)
                try validator.validate(input: activity.estimatedCost, fieldType: .cost)
            } catch {
                guard let error = error as? ValidationError else { return }
                self?.showAlertWith(title: "Wait...", message: error.localizedDescription)
                return
            }
            strongSelf.dataManager.didCreateActivity(for: strongSelf.trip, activity: activity)
            strongSelf.coordinator?.activityWasAdded()
        }
        
        addActivityView.header.backBtnAction = { [ weak self ] in
            guard let strongSelf = self else { return }
            strongSelf.coordinator?.didCancel()
        }
        
        addActivityView.header.btnAction = { [ weak self ] in
            guard let strongSelf = self else { return }
            strongSelf.coordinator?.didCancel()
        }
    }
}

// MARK - status bar color
extension AddActivityController {
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}
