//
//  DatePicker+Factory.swift
//  TravelPlanner
//
//  Created by christopher downey on 5/4/19.
//  Copyright © 2019 christopher downey. All rights reserved.
//

import Foundation
import UIKit

class DatePickerFactory {
    
    var datePicker: UIDatePicker!
    
    init() {
        datePicker = UIDatePicker(frame: .zero)
        datePicker.datePickerMode = .date
    }
    
    func build() -> UIDatePicker {
        return datePicker
    }
}
