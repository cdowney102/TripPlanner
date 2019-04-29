//
//  UIButton+Factorty.swift
//  TravelPlanner
//
//  Created by christopher downey on 4/28/19.
//  Copyright © 2019 christopher downey. All rights reserved.
//

import Foundation
import UIKit

final class ButtonFactory {
    
    private let button: UIButton
    
    init(image: UIImage) {
        self.button = UIButton()
        self.button.setImage(image, for: .normal)
    }
    
    func build() -> UIButton {
        return button
    }
}
