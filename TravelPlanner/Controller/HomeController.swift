//
//  ViewController.swift
//  TravelPlanner
//
//  Created by christopher downey on 4/28/19.
//  Copyright © 2019 christopher downey. All rights reserved.
//

import UIKit

class HomeController: UIViewController {
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    weak var mainCoordinator: MainCoordinator?
    var homeView: HomeView?
    var dataManager: DataManager
    
    init(dataManager: DataManager) {
        self.dataManager = dataManager
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        homeView?.dataSource.trips = Array(dataManager.trips.values)
        homeView?.setTotalCost()
        homeView?.collectionView.reloadData()
        homeView?.checkIfEmpty()
    }
    
    override func loadView() {
        super.loadView()
        
        homeView = HomeView(frame: view.bounds)
        
        guard let home = homeView else { return }
        view.addSubview(home)
        
        home.didSelect = { [ weak self ] trip in
            self?.update(trip)
        }
        
        home.header.btnAction = { [ weak self ] in
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

