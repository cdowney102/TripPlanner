//
//  ToolBar+Factory.swift
//  TravelPlanner
//
//  Created by christopher downey on 5/4/19.
//  Copyright © 2019 christopher downey. All rights reserved.
//

import Foundation
import UIKit

class ToolBarFactory {
    
    var toolBar: UIToolbar!
    
    init() {
        toolBar = UIToolbar()
        toolBar.sizeToFit()
    }
    
    func build() -> UIToolbar {
        return toolBar
    }
}
