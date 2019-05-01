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

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let homeView = HomeView(frame: view.bounds)
        view.addSubview(homeView)
        
        homeView.nextBtnAction = { [ weak self ] in
            guard let strongSelf = self else { return }
            strongSelf.next()
        }
        
    }

    func next() {
        print("coord next create")
        mainCoordinator?.create()
    }

}

