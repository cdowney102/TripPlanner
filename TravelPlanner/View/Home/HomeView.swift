//
//  HomeView.swift
//  TravelPlanner
//
//  Created by christopher downey on 4/28/19.
//  Copyright © 2019 christopher downey. All rights reserved.
//

import Foundation
import UIKit

class HomeView: UIView {
    
    var nextBtnAction: (() -> Void)?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        
        let header = Header(frame: CGRect(x: 0, y: 0, width: frame.width, height: frame.height * 0.17))
        header.setupUI("My Trips", "Where to next?")
        
        addSubview(header)
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
