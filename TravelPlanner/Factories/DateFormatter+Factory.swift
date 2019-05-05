//
//  DateFormatter+Factory.swift
//  TravelPlanner
//
//  Created by christopher downey on 5/4/19.
//  Copyright © 2019 christopher downey. All rights reserved.
//

import Foundation
import UIKit

class DateFormatterFactory {
    
    var dateFormatter: DateFormatter!
    
    init(format: String) {
        dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
    }
    
    func build() -> DateFormatter {
        return dateFormatter
    }
    
    
}
