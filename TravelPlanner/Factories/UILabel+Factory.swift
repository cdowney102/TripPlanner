//
//  UILabel+Factory.swift
//  TravelPlanner
//
//  Created by christopher downey on 4/28/19.
//  Copyright © 2019 christopher downey. All rights reserved.
//

import Foundation
import UIKit

final class LabelFactory {
    
    private let label: UILabel
    
    init(text: String, fontColor: UIColor, font: UIFont) {
        label = UILabel()
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = fontColor
        label.font = font
        label.text = text
        label.sizeToFit()
        label.adjustsFontSizeToFitWidth = true
    }
    
    func build() -> UILabel {
        return label
    }
}
