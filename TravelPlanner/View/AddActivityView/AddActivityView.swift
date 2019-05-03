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
    
    #warning("add left chevron to header to dismiss/ go back -- app store req")
    lazy var header = Header(frame: CGRect(x: 0, y: 0, width: frame.width, height: frame.height * 0.17))
    private var nameLabel = TextFieldFactory(placeholder: "Activity Name").build()
    private var estimatedCostLabel = TextFieldFactory(placeholder: "Estimated Cost").build()
    private var addButton = ButtonFactory(image: UIImage(named: "add.png")!).build()

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
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
        header.setupUI("Activity Name", "Sounds fun...", "$0")
        header.buttonType = .remove
    }
    
    private func setupLabels() {
        addSubviews(nameLabel, estimatedCostLabel)
        NSLayoutConstraint.activate([
            nameLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            nameLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -25),
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 35),
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -35),
            nameLabel.heightAnchor.constraint(equalToConstant: 25),
            
            estimatedCostLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            estimatedCostLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 25),
            estimatedCostLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            estimatedCostLabel.trailingAnchor.constraint(equalTo: nameLabel.trailingAnchor),
            estimatedCostLabel.heightAnchor.constraint(equalToConstant: 25)
            ])
    }
    
    private func setupButton() {
        addSubview(addButton)
        NSLayoutConstraint.activate([
            addButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            addButton.widthAnchor.constraint(equalToConstant: 65),
            addButton.heightAnchor.constraint(equalToConstant: 35),
            addButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -25)
            ])
    }
}
