//
//  AddTripView.swift
//  TravelPlanner
//
//  Created by christopher downey on 5/4/19.
//  Copyright © 2019 christopher downey. All rights reserved.
//

import Foundation
import UIKit

class AddTripView: UIView {
    
    var addTripBtnAction: (() -> Void)?
    var destination = ""
    var nickname = ""
    var startDate = ""
    var endDate = ""
    
    // MARK - UI objects
    lazy var header = Header(frame: CGRect(x: 0, y: 0, width: frame.width, height: frame.height * 0.17))
    private let addButton = ButtonFactory(image: UIImage(named: "pinkadd.png")!).build()
    private let destinationTextField = TextFieldFactory(placeholder: "Destination").build()
    private let tripNameTextField = TextFieldFactory(placeholder: "Trip nickname").build()
    private let tripStartDate = TextFieldFactory(placeholder: "Start Date").build()
    private let tripEndDate = TextFieldFactory(placeholder: "End Date").build()
    private let dateFormatter = DateFormatterFactory(format: "MMM d, yyyy").build()
    private var startDatePicker = DatePickerFactory().build()
    private var endDatePicker = DatePickerFactory().build()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .backgroundGray
        setupHeader()
        setupButton()
        setupLabels()
        setupDatePicker()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension AddTripView {
    private func setupHeader() {
        addSubview(header)
        header.setupUI(destination: "New Trip", tripName: "Don't forget the phone charger!", estCost: "$0", btnType: .remove, color: .pastePink)
    }
    
    private func setupLabels() {
        addSubviews(destinationTextField, tripNameTextField, tripStartDate, tripEndDate)
        destinationTextField.addDoneButton()
        tripNameTextField.addDoneButton()
        NSLayoutConstraint.activate([
            tripNameTextField.centerXAnchor.constraint(equalTo: centerXAnchor),
            tripNameTextField.centerYAnchor.constraint(equalTo: centerYAnchor),
            tripNameTextField.heightAnchor.constraint(equalToConstant: 25),
            tripNameTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 35),
            tripNameTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -35),
            
            destinationTextField.centerXAnchor.constraint(equalTo: centerXAnchor),
            destinationTextField.bottomAnchor.constraint(equalTo: tripNameTextField.topAnchor, constant: -35),
            destinationTextField.heightAnchor.constraint(equalTo: tripNameTextField.heightAnchor),
            destinationTextField.leadingAnchor.constraint(equalTo: tripNameTextField.leadingAnchor),
            destinationTextField.trailingAnchor.constraint(equalTo: tripNameTextField.trailingAnchor),
            
            tripStartDate.topAnchor.constraint(equalTo: tripNameTextField.bottomAnchor, constant: 35),
            tripStartDate.leadingAnchor.constraint(equalTo: destinationTextField.leadingAnchor),
            tripStartDate.heightAnchor.constraint(equalTo: tripNameTextField.heightAnchor),
            tripStartDate.widthAnchor.constraint(equalToConstant: 150),
            
            tripEndDate.topAnchor.constraint(equalTo: tripNameTextField.bottomAnchor, constant: 35),
            tripEndDate.trailingAnchor.constraint(equalTo: destinationTextField.trailingAnchor),
            tripEndDate.heightAnchor.constraint(equalTo: tripNameTextField.heightAnchor),
            tripEndDate.widthAnchor.constraint(equalToConstant: 150),
            ])
    }
    
    private func setupButton() {
        addSubview(addButton)
        addButton.addTarget(self, action: #selector(addTrip), for: .touchUpInside)
        NSLayoutConstraint.activate([
            addButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            addButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -35),
            addButton.heightAnchor.constraint(equalToConstant: 50),
            addButton.widthAnchor.constraint(equalToConstant: 50)
            ])
    }
    
    private func setupDatePicker() {
        let startToolbar = ToolBarFactory().build()
        let endToolbar = ToolBarFactory().build()
        
        let startDateDoneButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(startDonePicking))
        let endDateDoneButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(endDonePicking))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let startCancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelDatePicker))
        let endCancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelDatePicker))
        
        startToolbar.setItems([startDateDoneButton, spaceButton, startCancelButton], animated: false)
        endToolbar.setItems([endDateDoneButton, spaceButton, endCancelButton], animated: false)
        
        tripStartDate.inputAccessoryView = startToolbar
        tripStartDate.inputView = startDatePicker

        tripEndDate.inputAccessoryView = endToolbar
        tripEndDate.inputView = endDatePicker
    }
    
    @objc private func addTrip() {
        destination = destinationTextField.text ?? ""
        nickname = tripNameTextField.text ?? ""
        startDate = tripStartDate.text ?? ""
        endDate = tripEndDate.text ?? ""
        addTripBtnAction?()
    }
    
    @objc private func startDonePicking() {
        tripStartDate.text = dateFormatter.string(from: startDatePicker.date)
        endEditing(true)
    }
    
    @objc private func endDonePicking() {
        tripEndDate.text = dateFormatter.string(from: endDatePicker.date)
        endEditing(true)
    }
    
    @objc private func cancelDatePicker() {
        endEditing(true)
    }
}
