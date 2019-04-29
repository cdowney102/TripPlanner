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
    
    let buttonType: ButtonType = .add
    
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
        let titleLabel = LabelFactory(text: title, fontColor: .black, font: UIFont.systemFont(ofSize: 16)).build()
        let subTitleLabel = LabelFactory(text: title, fontColor: .black, font: UIFont.systemFont(ofSize: 14)).build()
        
        addSubviews(titleLabel, subTitleLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 15),
            titleLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -15),
            titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 5),
            titleLabel.heightAnchor.constraint(equalToConstant: 25),
            
            subTitleLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            subTitleLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            subTitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5),
            subTitleLabel.heightAnchor.constraint(equalToConstant: 25)
            ])
        
        var button: UIButton!
        
        switch buttonType {
        case .add:
            button = ButtonFactory(image: UIImage(named: "add-image")!).build()
            #warning("add actions here also")
        case .remove:
            button = ButtonFactory(image: UIImage(named: "del-image")!).build()
        }
    }
}
