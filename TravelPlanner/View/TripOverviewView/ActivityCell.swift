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
    
    var nameLabel = LabelFactory(text: "Activity Name", fontColor: .inputGray, font: .activityListNameFont).build()
    var costLabel = LabelFactory(text: "$22", fontColor: .inputGray, font: .activityListCostFont).build()
    static let identifier = "ActivityCell"
    
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
            
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 55),
            nameLabel.trailingAnchor.constraint(equalTo: costLabel.leadingAnchor),
            nameLabel.heightAnchor.constraint(equalToConstant: 25),
            nameLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
            ])
    }

    func setupUI(activityName: String, cost: String) {
        nameLabel.text = activityName
        costLabel.text = "$\(cost)"
    }
}

