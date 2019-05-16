//
//  OverlayViewFactory.swift
//  TravelPlanner
//
//  Created by christopher downey on 5/15/19.
//  Copyright © 2019 christopher downey. All rights reserved.
//

import Foundation
import UIKit

class OverlayViewFactory {
    var view: UIView!
    
    init(color: UIColor) {
        view = UIView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = color
    }
    
    func build() -> UIView {
        return view
    }
}
