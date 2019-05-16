//
//  UIView+Extensions.swift
//  TravelPlanner
//
//  Created by christopher downey on 4/28/19.
//  Copyright © 2019 christopher downey. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach { addSubview($0) }
    }
}

extension UIView {
    func addShadow(cornerRadius: CGFloat?) {
        self.layer.shadowColor = UIColor.inputGray.cgColor
        self.layer.shadowOffset = CGSize(width: 0.6, height: 1.2)
        self.layer.shadowOpacity = 0.4
        self.layer.masksToBounds = false
        if let radius = cornerRadius { self.layer.cornerRadius = radius }
    }
}
