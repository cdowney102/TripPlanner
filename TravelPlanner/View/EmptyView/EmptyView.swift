//
//  EmptyView.swift
//  TravelPlanner
//
//  Created by christopher downey on 4/30/19.
//  Copyright © 2019 christopher downey. All rights reserved.
//

import Foundation
import UIKit

class EmptyView: UIView {
    
    private let label = LabelFactory(text: "No trips planned", fontColor: .inputGray, font: .textFieldFont).build()
    private let icon: UIImageView = {
        let iv = UIImageView(frame: .zero)
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFit
        iv.image = UIImage(named: "aeroplane.png")!
        return iv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        setupIcon()
        setupLabel()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLabel() {
        addSubview(label)
        label.textAlignment = .center
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: centerXAnchor),
            label.heightAnchor.constraint(equalToConstant: 25),
            label.topAnchor.constraint(equalTo: icon.bottomAnchor, constant: 10),
            label.leadingAnchor.constraint(equalTo: leadingAnchor),
            label.trailingAnchor.constraint(equalTo: trailingAnchor),
            ])
    }
    
    private func setupIcon() {
        addSubview(icon)
        NSLayoutConstraint.activate([
            icon.centerXAnchor.constraint(equalTo: centerXAnchor),
            icon.topAnchor.constraint(equalTo: topAnchor, constant: 125),
            icon.heightAnchor.constraint(equalToConstant: 150),
            icon.widthAnchor.constraint(equalToConstant: 125)
            ])
    }
}
