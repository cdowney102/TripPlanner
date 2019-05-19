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
        // we have 17 images so reset cache if they have 17 trips to display
        if UIImageView.imagecounter == 17 { UIImageView.usedImageCache.removeAll() }
        var random = Int.random(in: 1...17)
        var image = UIImage(named: "\(random).png")!
        while UIImageView.usedImageCache.contains(image) {
            random = Int.random(in: 1...17)
            image = UIImage(named: "\(random).png")!
        }
        self.image = image
        UIImageView.usedImageCache.insert(image)
        UIImageView.imagecounter += 1
    }
}
