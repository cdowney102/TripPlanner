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
    func setupUI(destination: String, tripName: String, estCost: String, btnType: ButtonType) {
        titleLabel = LabelFactory(text: destination, fontColor: .titleWhite, font: .titleFont).build()
        subtitleLabel = LabelFactory(text: tripName, fontColor: .titleWhite, font: .subTitleFont).build()
        estimatedCostLabel = LabelFactory(text: estCost, fontColor: .titleWhite, font: .SubSubTitleFont).build()
        button = ButtonFactory(image: UIImage(named: "pinkadd.png")!).build()
        backButton = ButtonFactory(image: UIImage(named: "left.png")!).build()
        
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        buttonType = btnType
        
        addSubviews(titleLabel, subtitleLabel, estimatedCostLabel, button, backButton)
        #warning("change this - add button on right first, also maybe get rtid of this and use set labels outside - this setup should be internal -- make labels sizetofit adjusts fontsize")
        NSLayoutConstraint.activate([
            backButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            backButton.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 15),
            backButton.heightAnchor.constraint(equalToConstant: 35),
            backButton.widthAnchor.constraint(equalToConstant: 35),
            
            estimatedCostLabel.leadingAnchor.constraint(equalTo: backButton.trailingAnchor, constant: 5),
            estimatedCostLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            estimatedCostLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5),
            estimatedCostLabel.heightAnchor.constraint(equalToConstant: 25),
            
            subtitleLabel.leadingAnchor.constraint(equalTo: estimatedCostLabel.leadingAnchor),
            subtitleLabel.trailingAnchor.constraint(equalTo: estimatedCostLabel.trailingAnchor),
            subtitleLabel.bottomAnchor.constraint(equalTo: estimatedCostLabel.topAnchor),
            subtitleLabel.heightAnchor.constraint(equalToConstant: 25),
            
            titleLabel.leadingAnchor.constraint(equalTo: estimatedCostLabel.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: estimatedCostLabel.trailingAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: subtitleLabel.topAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: 25),
            
            button.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            button.bottomAnchor.constraint(equalTo: subtitleLabel.bottomAnchor),
            button.heightAnchor.constraint(equalToConstant: 50),
            button.widthAnchor.constraint(equalToConstant: 50)
            ])
    }
    
    @objc private func backButtonTapped() {
        backBtnAction?()
    }
    
    @objc private func buttonTapped() {
        btnAction?()
    }
    
    private func updateButton() {
        switch buttonType {
        case .add:
            button.setImage(UIImage(named: "pinkadd.png"), for: .normal)
        case .remove:
            button.setImage(UIImage(named: "pinkdelete.png"), for: .normal)
        }
    }

    func setBackgroundTo(_ color: UIColor) {
        backgroundColor = color
    }
}
