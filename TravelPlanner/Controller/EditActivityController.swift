//
//  EditController.swift
//  TravelPlanner
//
//  Created by christopher downey on 5/2/19.
//  Copyright © 2019 christopher downey. All rights reserved.
//

import UIKit

class EditActivityController: UIViewController {
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    weak var coordinator: EditActivityCoordinator?
    var activity: Activity!
    var trip: Trip!
    var dataManager: DataManager
    
    init(dataManager: DataManager) {
        self.dataManager = dataManager
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        
        let editView = EditActivityView(frame: view.frame)
        view.addSubview(editView)
        
        editView.header.setupUI(destination: trip.destination, tripName: activity.name, estCost: "$\(activity.estimatedCost)", btnType: .remove, color: .pastelBeige)
        editView.nameTextField.text = activity.name
        editView.costTextField.text = activity.estimatedCost
        
        editView.header.backBtnAction = { [ weak self ] in
            guard let strongSelf = self else { return }
            strongSelf.coordinator?.didCancel()
        }
        
        editView.header.btnAction = { [ weak self ] in
            guard let strongSelf = self else { return }
            strongSelf.dataManager.didDeleteActivity(from: strongSelf.trip, activity: strongSelf.activity)
            strongSelf.coordinator?.didCancel()
        }
        
        editView.updateBtnAction = { [ weak self ] in
            guard let strongSelf = self else { return }
            if editView.nameTextField.text != "" {
                strongSelf.activity.name = editView.nameTextField.text ?? "Activity Name"
            }
            
            if editView.costTextField.text != "" {
                let validator = TextValidator()
                do {
                    try validator.validate(input: editView.costTextField.text ?? "", fieldType: .cost)
                    strongSelf.activity.estimatedCost = editView.costTextField.text ?? "0"
                } catch {
                    guard let error = error as? ValidationError else { return }
                    strongSelf.showAlertWith(title: "Whoops...", message: error.localizedDescription)
                    return
                }
            }
            strongSelf.dataManager.didEditActivity(for: strongSelf.trip, activity: strongSelf.activity)
            strongSelf.coordinator?.didCancel()
        }
    }
}
