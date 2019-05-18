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
    var dataManager: DataManager
    lazy var homeView: HomeView = HomeView(frame: view.frame)
    
    init(dataManager: DataManager) {
        self.dataManager = dataManager
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        homeView.dataSource.trips = Array(dataManager.trips.values)
        homeView.collectionView.reloadData()
        homeView.setTotalCost()
        homeView.checkIfEmpty()
    }
    
    override func loadView() {
        super.loadView()
        setupHomeView()
    }
}

// MARK - navigation flow
extension HomeController {
    private func update(_ trip: Trip) {
        mainCoordinator?.overview(trip)
    }
    
    private func create() {
        mainCoordinator?.create()
    }
}

// MARK - view setup
extension HomeController {
    private func setupHomeView() {
        view.addSubview(homeView)
        
        homeView.didSelect = { [ weak self ] trip in
            guard let strongSelf = self else { return }
            strongSelf.update(trip)
        }
        
        homeView.header.btnAction = { [ weak self ] in
            guard let strongSelf = self else { return }
            strongSelf.create()
        }
    }
}

// MARK - status bar color
extension HomeController {
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}
