//
//  TravelPlannerTests.swift
//  TravelPlannerTests
//
//  Created by christopher downey on 4/28/19.
//  Copyright © 2019 christopher downey. All rights reserved.
//

import XCTest
@testable import TravelPlanner

class TravelPlannerTests: XCTestCase {
    
    func test_homeView_sets_correct_label_text() {
        let sut = SUTFactory()
        sut.setupUI("title", "subtitle")
        
        XCTAssertEqual(sut.titleLabel.text ?? "", "title")
        XCTAssertEqual(sut.subtitleLabel.text ?? "", "subtitle")
    }

    
    // MARK - HELPERS
    func SUTFactory() -> Header {
        let sut = Header(frame: .zero)
        sut.buttonType = .add
        return sut
    }

}
