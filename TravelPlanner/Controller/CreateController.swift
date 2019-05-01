//
//  CreateController.swift
//  TravelPlanner
//
//  Created by christopher downey on 4/29/19.
//  Copyright © 2019 christopher downey. All rights reserved.
//

import UIKit

class CreateController: UIViewController {
    
    deinit {
        print("create gonce")
    }

    weak var coordinator: CreateCoordinator?
    private var trip: Trip?
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = .green
        ssetupButton()
        
    }
    
    func ssetupButton() {
        let button = UIButton(frame: .zero)
        view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        button.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        button.setTitle("next", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(nextTapped), for: .touchUpInside)
    }
    
    @objc func nextTapped() {
        print("go next")
        if let trip = trip {
            coordinator?.didFinishCreating(trip: trip)
        } else {
            coordinator?.didCancel()
        }
    }
    
}
