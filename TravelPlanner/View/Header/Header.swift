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
    
    var buttonType: ButtonType = .add {
        didSet {
            updateButton()
        }
    }
    var titleLabel: UILabel!
    var subtitleLabel: UILabel!
    var estimatedCostLabel: UILabel!
    var button: UIButton!
    
    var addBtnAction: (() -> Void)?
    var deleteBtnAction: (() -> Void)?
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        backgroundColor = .lightGray
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension Header {
    func setupUI(_ title: String, _ subTitle: String, _ cost: String) {
        titleLabel = LabelFactory(text: title, fontColor: .black, font: UIFont.systemFont(ofSize: 16)).build()
        subtitleLabel = LabelFactory(text: subTitle, fontColor: .black, font: UIFont.systemFont(ofSize: 14)).build()
        estimatedCostLabel = LabelFactory(text: cost, fontColor: .black, font: UIFont.systemFont(ofSize: 14)).build()
        button = ButtonFactory(image: UIImage(named: "add.png")!).build()
        
        addSubviews(titleLabel, subtitleLabel, estimatedCostLabel, button)
        
        NSLayoutConstraint.activate([
            estimatedCostLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
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
    
    func updateButton() {
        switch buttonType {
        case .add:
            button.setImage(UIImage(named: "add.png"), for: .normal)
            break
            #warning("add actions here also")
        case .remove:
            button.setImage(UIImage(named: "delete.png"), for: .normal)
            break
        }
    }
}
