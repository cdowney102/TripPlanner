//
//  EditActivityView.swift
//  TravelPlanner
//
//  Created by christopher downey on 5/2/19.
//  Copyright © 2019 christopher downey. All rights reserved.
//

import Foundation
import UIKit

class EditActivityView: UIView {
    
    lazy var header = Header(frame: CGRect(x: 0, y: 0, width: frame.width, height: frame.height * 0.17))
    let nameTextField = TextFieldFactory(placeholder: "Activity Name").build()
    let costTextField = TextFieldFactory(placeholder: "Estimated cost - $0").build()
    var updateBtnAction: (() -> Void)?
    private var updateButton = ButtonFactory(image: UIImage(named: "pinkadd.png")!).build()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .backgroundGray
        setupHeader()
        setupLabels()
        setupButton()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension EditActivityView {
    private func setupHeader() {
//        header.setBackgroundTo(.pastelBeige)
        addSubview(header)
    }
    
    private func setupLabels() {
        addSubviews(nameTextField, costTextField)
        nameTextField.delegate = self
        costTextField.delegate = self
        nameTextField.addDoneButton()
        costTextField.addDoneButton()
        NSLayoutConstraint.activate([
            nameTextField.centerXAnchor.constraint(equalTo: centerXAnchor),
            nameTextField.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -35),
            nameTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 35),
            nameTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -35),
            nameTextField.heightAnchor.constraint(equalToConstant: 25),
            
            costTextField.centerXAnchor.constraint(equalTo: centerXAnchor),
            costTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 45),
            costTextField.leadingAnchor.constraint(equalTo: nameTextField.leadingAnchor),
            costTextField.trailingAnchor.constraint(equalTo: nameTextField.trailingAnchor),
            costTextField.heightAnchor.constraint(equalToConstant: 25)
            ])
    }
    
    private func setupButton() {
        addSubview(updateButton)
        NSLayoutConstraint.activate([
            updateButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            updateButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -25),
            updateButton.widthAnchor.constraint(equalToConstant: 50),
            updateButton.heightAnchor.constraint(equalToConstant: 50)
            ])
    }
    
    @objc private func updateTapped() {
        updateBtnAction?()
    }
}

extension EditActivityView: UITextFieldDelegate {}
