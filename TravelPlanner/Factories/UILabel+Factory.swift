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
        self.label = UILabel()
        self.label.textAlignment = .left
        self.label.translatesAutoresizingMaskIntoConstraints = false
        self.label.textColor = fontColor
        self.label.font = font
        self.label.text = text
        self.label.sizeToFit()
    }
    
    func build() -> UILabel {
        return label
    }
}
