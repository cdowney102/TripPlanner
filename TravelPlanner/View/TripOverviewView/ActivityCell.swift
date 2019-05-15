//
//  ActivityCell.swift
//  TravelPlanner
//
//  Created by christopher downey on 5/1/19.
//  Copyright © 2019 christopher downey. All rights reserved.
//

import Foundation
import UIKit

class ActivityCell: UITableViewCell {
    
    static let identifier = "ActivityCell"
    
    var nameLabel = LabelFactory(text: "Activity Name", fontColor: .black, font: .systemFont(ofSize: 16)).build()
    var costLabel = LabelFactory(text: "$22", fontColor: .black, font: .systemFont(ofSize: 16)).build()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: ActivityCell.identifier)
        setupLabels()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLabels() {
        addSubviews(nameLabel, costLabel)
        NSLayoutConstraint.activate([
            costLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
            costLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            costLabel.heightAnchor.constraint(equalToConstant: 25),
            costLabel.widthAnchor.constraint(equalToConstant: 65),
            
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            nameLabel.trailingAnchor.constraint(equalTo: costLabel.leadingAnchor),
            nameLabel.heightAnchor.constraint(equalToConstant: 25),
            nameLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
            ])
    }
    #warning("do sth wih spaces when trip doesnt have nick name - just put default")
    func setupUI(activityName: String, cost: String) {
        nameLabel.text = activityName
        costLabel.text = "$\(cost)"
    }
}

