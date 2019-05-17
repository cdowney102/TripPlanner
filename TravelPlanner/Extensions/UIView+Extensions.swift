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

extension UIView {
    private func growBack() {
        UIView.animate(withDuration: 0.15) {
            self.transform = CGAffineTransform(scaleX: 1, y: 1)
            self.setNeedsLayout()
        }
    }
    
    func fireTapAnimation(completion: @escaping () -> Void) {
        UIView.animate(withDuration: 0.2, animations: {
            self.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
            self.setNeedsLayout()
        }) { _ in
            self.growBack()
            completion()
        }
    }
    
    func fireButtonTapAnimation(completion: @escaping () -> Void) {
        UIView.animate(withDuration: 0.15, animations: {
            self.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
            self.setNeedsLayout()
        }) { _ in
            self.growBack()
            completion()
        }
    }
}
