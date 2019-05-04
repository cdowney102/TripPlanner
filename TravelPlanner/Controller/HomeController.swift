//
//  ViewController.swift
//  TravelPlanner
//
//  Created by christopher downey on 4/28/19.
//  Copyright © 2019 christopher downey. All rights reserved.
//

import UIKit

class HomeController: UIViewController {
    
    weak var mainCoordinator: MainCoordinator?

    override func loadView() {
        super.loadView()
        
        let homeView = HomeView(frame: view.bounds)
        view.addSubview(homeView)
        
        homeView.didSelect = { [ weak self ] trip in
            self?.update(trip)
        }
        
        homeView.header.btnAction = { [ weak self ] in
            self?.create()
        }
        
    }
    
    func update(_ trip: Trip) {
        mainCoordinator?.overview(trip)
    }

    func create() {
        mainCoordinator?.create()
    }

}

