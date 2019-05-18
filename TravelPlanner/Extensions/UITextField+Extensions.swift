//
//  UITextField+Extensions.swift
//  TravelPlanner
//
//  Created by christopher downey on 5/13/19.
//  Copyright © 2019 christopher downey. All rights reserved.
//

import Foundation
import UIKit

extension UITextField {
    func addDoneButton() {
        let doneButton: UIBarButtonItem = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(doneTapped))
        let toolbar: UIToolbar = UIToolbar(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50))
        let space = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let items = [space, doneButton]

        toolbar.barStyle = .default
        toolbar.items = items
        toolbar.sizeToFit()
        inputAccessoryView = toolbar
    }
    
    @objc private func doneTapped() {
        resignFirstResponder()
    }
}
