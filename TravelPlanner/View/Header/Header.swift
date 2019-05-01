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
    
    var buttonType: ButtonType = .add
    var titleLabel: UILabel!
    var subtitleLabel: UILabel!
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
    func setupUI(_ title: String, _ subTitle: String) {
        titleLabel = LabelFactory(text: title, fontColor: .black, font: UIFont.systemFont(ofSize: 16)).build()
        subtitleLabel = LabelFactory(text: subTitle, fontColor: .black, font: UIFont.systemFont(ofSize: 14)).build()
        
        buildButton()
        
        addSubviews(titleLabel, subtitleLabel, button)
        
        NSLayoutConstraint.activate([
            subtitleLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            subtitleLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            subtitleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            subtitleLabel.heightAnchor.constraint(equalToConstant: 25),
            
            titleLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 15),
            titleLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -15),
            titleLabel.bottomAnchor.constraint(equalTo: subtitleLabel.topAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: 25),
            
            button.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            button.bottomAnchor.constraint(equalTo: subtitleLabel.bottomAnchor),
            button.heightAnchor.constraint(equalToConstant: 50),
            button.widthAnchor.constraint(equalToConstant: 50)
            ])
    }
    
    func buildButton() {
        switch buttonType {
        case .add:
            button = ButtonFactory(image: UIImage(named: "add.png")!).build()
            break
            #warning("add actions here also")
        case .remove:
            button = ButtonFactory(image: UIImage(named: "delete.png")!).build()
            break
        }
    }
}
