//
//  Header.swift
//  TravelPlanner
//
//  Created by christopher downey on 4/28/19.
//  Copyright © 2019 christopher downey. All rights reserved.
//

import Foundation
import UIKit

enum ButtonType {
    case add, remove
}

final class Header: UIView {
    
    var buttonType: ButtonType = .add { didSet { updateButton() } }
    var titleLabel: UILabel!
    var subtitleLabel: UILabel!
    var estimatedCostLabel: UILabel!
    var button: UIButton!
    var backButton: UIButton!
    var homeHeader = false
    
    var btnAction: (() -> Void)?
    var backBtnAction: (() -> Void)?
    
    override init(frame: CGRect) {
        super.init(frame: frame)

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension Header {
    func setupUI(destination: String, tripName: String, estCost: String, btnType: ButtonType, color: UIColor) {
        backgroundColor = color
        
        titleLabel = LabelFactory(text: destination, fontColor: .titleWhite, font: .titleFont).build()
        subtitleLabel = LabelFactory(text: tripName, fontColor: .titleWhite, font: .subTitleFont).build()
        estimatedCostLabel = LabelFactory(text: estCost, fontColor: .titleWhite, font: .SubSubTitleFont).build()
        button = ButtonFactory(image: UIImage(named: "pinkadd.png")!).build()
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        buttonType = btnType
        
        if homeHeader {
            setupHomeHeader()
        } else {
            setupRegularHeader()
        }
    }
    
    private func setupHomeHeader() {
        addSubviews(titleLabel, subtitleLabel, estimatedCostLabel, button)
        #warning("change this - add button on right first, also maybe get rtid of this and use set labels outside - this setup should be internal -- make labels sizetofit adjusts fontsize")
        NSLayoutConstraint.activate([
            button.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25),
            button.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 15),
            button.heightAnchor.constraint(equalToConstant: 50),
            button.widthAnchor.constraint(equalToConstant: 50),
            
            subtitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 35),
            subtitleLabel.trailingAnchor.constraint(equalTo: button.leadingAnchor, constant: -10),
            subtitleLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 15),
            subtitleLabel.heightAnchor.constraint(equalToConstant: 25),
            
            titleLabel.leadingAnchor.constraint(equalTo: subtitleLabel.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: subtitleLabel.trailingAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: subtitleLabel.topAnchor, constant: 3),
            titleLabel.heightAnchor.constraint(equalToConstant: 25),
            
            estimatedCostLabel.leadingAnchor.constraint(equalTo: subtitleLabel.leadingAnchor),
            estimatedCostLabel.trailingAnchor.constraint(equalTo: subtitleLabel.trailingAnchor),
            estimatedCostLabel.topAnchor.constraint(equalTo: subtitleLabel.bottomAnchor, constant: -5),
            estimatedCostLabel.heightAnchor.constraint(equalToConstant: 25),
            ])
    }
    
    private func setupRegularHeader() {
        backButton = ButtonFactory(image: UIImage(named: "left.png")!).build()
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        
        addSubviews(titleLabel, subtitleLabel, estimatedCostLabel, button, backButton)
        #warning("change this - add button on right first, also maybe get rtid of this and use set labels outside - this setup should be internal -- make labels sizetofit adjusts fontsize")
        NSLayoutConstraint.activate([
            button.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25),
            button.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 15),
            button.heightAnchor.constraint(equalToConstant: 50),
            button.widthAnchor.constraint(equalToConstant: 50),
            
            backButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            backButton.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 20),
            backButton.heightAnchor.constraint(equalToConstant: 30),
            backButton.widthAnchor.constraint(equalToConstant: 30),
            
            subtitleLabel.leadingAnchor.constraint(equalTo: backButton.trailingAnchor, constant: 10),
            subtitleLabel.trailingAnchor.constraint(equalTo: button.leadingAnchor, constant: -10),
            subtitleLabel.centerYAnchor.constraint(equalTo: backButton.centerYAnchor),
            subtitleLabel.heightAnchor.constraint(equalToConstant: 25),
            
            titleLabel.leadingAnchor.constraint(equalTo: subtitleLabel.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: subtitleLabel.trailingAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: subtitleLabel.topAnchor, constant: 3),
            titleLabel.heightAnchor.constraint(equalToConstant: 25),
            
            estimatedCostLabel.leadingAnchor.constraint(equalTo: subtitleLabel.leadingAnchor),
            estimatedCostLabel.trailingAnchor.constraint(equalTo: subtitleLabel.trailingAnchor),
            estimatedCostLabel.topAnchor.constraint(equalTo: subtitleLabel.bottomAnchor, constant: -5),
            estimatedCostLabel.heightAnchor.constraint(equalToConstant: 25),
            ])
    }
    
    @objc private func backButtonTapped() {
        backBtnAction?()
    }
    
    @objc private func buttonTapped() {
        button.fireTapAnimation { [ weak self ] in
            guard let strongSelf = self else { return }
            strongSelf.btnAction?()
        }
    }
    
    private func updateButton() {
        switch buttonType {
        case .add:
            button.setImage(UIImage(named: "pinkadd.png"), for: .normal)
        case .remove:
            button.setImage(UIImage(named: "pinkdelete.png"), for: .normal)
        }
    }
}
