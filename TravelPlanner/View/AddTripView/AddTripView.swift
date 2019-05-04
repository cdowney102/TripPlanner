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
    
    lazy var header = Header(frame: CGRect(x: 0, y: 0, width: frame.width, height: frame.height * 0.17))
    let addButton = ButtonFactory(image: UIImage(named: "add.png")!).build()
    let destinationTextField = TextFieldFactory(placeholder: "Destination").build()
    let tripNameTextField = TextFieldFactory(placeholder: "Trip nickname").build()
    let tripStartDate = TextFieldFactory(placeholder: "Start Date").build()
    let tripEndDate = TextFieldFactory(placeholder: "End Date").build()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setupHeader()
        setupButton()
        setupLabels()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension AddTripView {
    private func setupHeader() {
        addSubview(header)
        header.setupUI("New Trip", "Don't forget the phone charger!", "$0")
        header.buttonType = .remove
    }
    
    private func setupLabels() {
        addSubviews(destinationTextField, tripNameTextField, tripStartDate, tripEndDate)
        NSLayoutConstraint.activate([
            tripNameTextField.centerXAnchor.constraint(equalTo: centerXAnchor),
            tripNameTextField.centerYAnchor.constraint(equalTo: centerYAnchor),
            tripNameTextField.heightAnchor.constraint(equalToConstant: 25),
            tripNameTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
            tripNameTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25),
            
            destinationTextField.centerXAnchor.constraint(equalTo: centerXAnchor),
            destinationTextField.bottomAnchor.constraint(equalTo: tripNameTextField.topAnchor, constant: -25),
            destinationTextField.heightAnchor.constraint(equalTo: tripNameTextField.heightAnchor),
            destinationTextField.leadingAnchor.constraint(equalTo: tripNameTextField.leadingAnchor),
            destinationTextField.trailingAnchor.constraint(equalTo: tripNameTextField.trailingAnchor),
            
            tripStartDate.topAnchor.constraint(equalTo: tripNameTextField.bottomAnchor, constant: 25),
            tripStartDate.leadingAnchor.constraint(equalTo: destinationTextField.leadingAnchor, constant: 15),
            tripStartDate.heightAnchor.constraint(equalTo: tripNameTextField.heightAnchor),
            tripStartDate.widthAnchor.constraint(equalToConstant: 100),
            
            tripEndDate.topAnchor.constraint(equalTo: tripNameTextField.bottomAnchor, constant: 25),
            tripEndDate.trailingAnchor.constraint(equalTo: destinationTextField.trailingAnchor, constant: -15),
            tripEndDate.heightAnchor.constraint(equalTo: tripNameTextField.heightAnchor),
            tripEndDate.widthAnchor.constraint(equalToConstant: 100),
            ])
    }
    
    private func setupButton() {
        addSubview(addButton)
        NSLayoutConstraint.activate([
            addButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            addButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -35),
            addButton.heightAnchor.constraint(equalToConstant: 45),
            addButton.widthAnchor.constraint(equalToConstant: 45)
            ])
    }
}
