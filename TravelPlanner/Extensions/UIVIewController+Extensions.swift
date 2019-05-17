//
//  UIVIewController+Extensions.swift
//  TravelPlanner
//
//  Created by christopher downey on 5/17/19.
//  Copyright © 2019 christopher downey. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    func showAlertWith(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Whoops", style: .default, handler: nil)
        alert.addAction(alertAction)
        present(alert, animated: true, completion: nil)
    }
}
