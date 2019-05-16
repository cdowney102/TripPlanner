//
//  UIImageView+Extensions.swift
//  TravelPlanner
//
//  Created by christopher downey on 5/15/19.
//  Copyright © 2019 christopher downey. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {
    static var imagecounter = 0
    static var usedImageCache = Set<UIImage>()
    
    func setRandomImage() {
        var random = Int.random(in: 1..<37)
        var image = UIImage(named: "\(random).png")!
        while UIImageView.usedImageCache.contains(image) {
            random = Int.random(in: 1..<37)
            image = UIImage(named: "\(random).png")!
        }
        self.image = image
        UIImageView.usedImageCache.insert(image)
    }
}
