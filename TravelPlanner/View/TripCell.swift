//
//  TripCell.swift
//  TravelPlanner
//
//  Created by christopher downey on 5/1/19.
//  Copyright © 2019 christopher downey. All rights reserved.
//

import Foundation
import UIKit

class TripCell: UICollectionViewCell {
    
    private var tripTitle: UILabel!
    private var tripDate: UILabel!
    private var tripEstimatedCost: UILabel!
    
    static let identifier = "TripCellID"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .gray
        layer.cornerRadius = 15
        setupLabels()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setLabelText(tripName: String, date: String, tripCost: String) {
        tripTitle.text = tripName
        tripDate.text = date
        tripEstimatedCost.text = tripCost
    }
    
    private func setupLabels() {
        tripTitle = LabelFactory(text: "Trip Name", fontColor: .black, font: .systemFont(ofSize: 18)).build()
        tripDate = LabelFactory(text: "Trip Date", fontColor: .black, font: .systemFont(ofSize: 16)).build()
        tripEstimatedCost = LabelFactory(text: "Trip Cost", fontColor: .black, font: .systemFont(ofSize: 16)).build()
        
        addSubviews(tripTitle, tripDate, tripEstimatedCost)
        
        NSLayoutConstraint.activate([
            tripDate.centerYAnchor.constraint(equalTo: centerYAnchor),
            tripDate.heightAnchor.constraint(equalToConstant: 25),
            tripDate.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            tripDate.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            tripEstimatedCost.topAnchor.constraint(equalTo: tripDate.bottomAnchor),
            tripEstimatedCost.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            tripEstimatedCost.trailingAnchor.constraint(equalTo: trailingAnchor),
            tripEstimatedCost.heightAnchor.constraint(equalTo: tripDate.heightAnchor),
            
            tripTitle.bottomAnchor.constraint(equalTo: tripDate.topAnchor),
            tripTitle.leadingAnchor.constraint(equalTo: tripDate.leadingAnchor),
            tripTitle.trailingAnchor.constraint(equalTo: tripDate.trailingAnchor),
            tripTitle.heightAnchor.constraint(equalTo: tripDate.heightAnchor),
            ])
    }
}
