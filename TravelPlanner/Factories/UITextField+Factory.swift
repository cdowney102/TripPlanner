//
//  UITextField+Factory.swift
//  TravelPlanner
//
//  Created by christopher downey on 5/2/19.
//  Copyright © 2019 christopher downey. All rights reserved.
//

import Foundation
import UIKit

class TextFieldFactory {
    
    var textField: UITextField!
    
    init(placeholder: String) {
        textField = UITextField(frame: .zero)
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = placeholder
        textField.textAlignment = .center
        textField.textColor = .inputGray
        textField.font = .textFieldFont
        addBottomBorder()
    }
    
    func build() -> UITextField {
        return textField
    }
}

extension TextFieldFactory {
    private func addBottomBorder() {
        let border = UIView(frame: .zero)
        border.translatesAutoresizingMaskIntoConstraints = false
        border.backgroundColor = .inputGray
        textField.addSubview(border)
        NSLayoutConstraint.activate([
            border.leadingAnchor.constraint(equalTo: textField.leadingAnchor),
            border.trailingAnchor.constraint(equalTo: textField.trailingAnchor),
            border.bottomAnchor.constraint(equalTo: textField.bottomAnchor),
            border.heightAnchor.constraint(equalToConstant: 1)
            ])
    }
}
