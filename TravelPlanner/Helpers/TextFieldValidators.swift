//
//  TextFieldValidator+Factory.swift
//  TravelPlanner
//
//  Created by christopher downey on 5/6/19.
//  Copyright © 2019 christopher downey. All rights reserved.
//
#warning("write some tests...")
import Foundation
import UIKit

protocol Validator {
    func validate(input: String, fieldType: TextFieldType) throws
}

extension Validator {
    func validate(input: String, fieldType: TextFieldType) throws {
        switch fieldType {
        case .cost:
            if !input.isInt {
                throw ValidationError.invalidNumber
            }
        default:
            if input == "" {
                throw ValidationError.emptyFields
            }
        }
    }
}

// MARK - validators
struct TextValidator: Validator {}

// MARK - Errors
enum ValidationError: Error {
    case emptyFields, invalidNumber
    
    var localizedDescription: String {
        switch self {
        case .emptyFields:
            return NSLocalizedString("Fill out all fields", comment: "")
        default:
            return NSLocalizedString("Invalid number for cost", comment: "")
        }
    }
}
