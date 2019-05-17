//
//  AddActivityView.swift
//  TravelPlanner
//
//  Created by christopher downey on 5/2/19.
//  Copyright © 2019 christopher downey. All rights reserved.
//

import Foundation
import UIKit

class AddActivityView: UIView {
    
    var name = ""
    var cost = "0"
    
    // MARK - UI objects
    lazy var header = Header(frame: CGRect(x: 0, y: 0, width: frame.width, height: frame.height * 0.17))
    private var nameTextField = TextFieldFactory(placeholder: "Activity Name").build()
    private var estimatedCostTextField = TextFieldFactory(placeholder: "Estimated Cost").build()
    private var addButton = ButtonFactory(image: UIImage(named: "pinkadd.png")!).build()
    var addBtnAction: (() -> Void)?

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

extension AddActivityView {
    private func setupHeader() {
        addSubview(header)
        header.setupUI(destination: "What's the plan?", tripName: "decisions, decisions", estCost: "$0", btnType: .remove, color: .pastelPurple)
    }
    
    private func setupLabels() {
        addSubviews(nameTextField, estimatedCostTextField)
        nameTextField.addDoneButton()
        estimatedCostTextField.addDoneButton()
        NSLayoutConstraint.activate([
            nameTextField.centerXAnchor.constraint(equalTo: centerXAnchor),
            nameTextField.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -35),
            nameTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 35),
            nameTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -35),
            nameTextField.heightAnchor.constraint(equalToConstant: 25),
            
            estimatedCostTextField.centerXAnchor.constraint(equalTo: centerXAnchor),
            estimatedCostTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 45),
            estimatedCostTextField.leadingAnchor.constraint(equalTo: nameTextField.leadingAnchor),
            estimatedCostTextField.trailingAnchor.constraint(equalTo: nameTextField.trailingAnchor),
            estimatedCostTextField.heightAnchor.constraint(equalToConstant: 25)
            ])
    }
    
    private func setupButton() {
        addSubview(addButton)
        addButton.addTarget(self, action: #selector(addTapped), for: .touchUpInside)
        NSLayoutConstraint.activate([
            addButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            addButton.widthAnchor.constraint(equalToConstant: 60),
            addButton.heightAnchor.constraint(equalToConstant: 60),
            addButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -25)
            ])
    }
    
    @objc private func addTapped() {
        name = nameTextField.text ?? ""
        cost = estimatedCostTextField.text ?? "0"
        if cost == "" { cost = "0" }
        addBtnAction?()
    }
}
