//
//  UIImageViewFactory.swift
//  TravelPlanner
//
//  Created by christopher downey on 5/15/19.
//  Copyright © 2019 christopher downey. All rights reserved.
//

import Foundation
import UIKit

class ImageViewFactory {
    
    var imageView: UIImageView!
    
    init() {
        imageView = UIImageView(frame: .zero)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.setRandomImage()
    }
    
    func build() -> UIImageView {
        return imageView
    }
}
