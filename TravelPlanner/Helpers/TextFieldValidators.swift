//
//  TextFieldValidator+Factory.swift
//  TravelPlanner
//
//  Created by christopher downey on 5/6/19.
//  Copyright © 2019 christopher downey. All rights reserved.
//

import Foundation
import UIKit

protocol Validator {
    var input: String { get }
    func validate() throws
}

extension Validator {
    func isEmpty(input: String) -> Bool {
        return input == ""
    }
}

// MARK - validators

struct TripNameValidator: Validator {
    var input: String
    
    init(_ input: String) {
        self.input = input
    }
    
    func validate() throws {
        if isEmpty(input: input) {
            throw ValidationError.emptyFields
        }
    }
}

struct TripCostValidator: Validator {
    
    var input: String
    
    init(_ input: String) {
        self.input = input
    }
    
    func validate() throws {
        if isEmpty(input: input) {
            throw ValidationError.emptyFields
        }
    }
}

struct TripDateValidator: Validator {
    
    var input: String
    var startDate: Date
    var endDate: Date
    
    init(_ input: String, start: Date, end: Date) {
        self.input = input
        self.startDate = start
        self.endDate = end
    }
    
    func validate() throws {
        if isEmpty(input: input) {
            throw ValidationError.emptyFields
        } else if !isValidDateSet() {
            throw ValidationError.invalidTripDates
        }
    }
    
    private func isValidDateSet() -> Bool {
        return startDate < endDate
    }
}

// MARK - Errors

enum ValidationError: Error {
    case emptyFields, invalidTripDates
}
