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
    
    private var tripTitle: UILabel = LabelFactory(text: "Trip Name", fontColor: .titleWhite, font: .titleFont).build()
    private var tripDate: UILabel = LabelFactory(text: "Trip Date", fontColor: .titleWhite, font: .subTitleFont).build()
    private var tripEstimatedCost: UILabel = LabelFactory(text: "Trip Cost", fontColor: .titleWhite, font: .SubSubTitleFont).build()
    private var overlay = OverlayViewFactory(color: .cellOverlayTint).build()
    private var imageView = ImageViewFactory().build()
    static let identifier = "TripCellID"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
//        layer.cornerRadius = 15
        backgroundColor = .white
        addShadow(cornerRadius: 15)
        setupImageView()
        setupOverlay()
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
    
    private func setupImageView() {
        addSubview(imageView)
        imageView.layer.cornerRadius = 15
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor)
            ])
    }
    
    private func setupOverlay() {
        imageView.addSubview(overlay)
        overlay.layer.cornerRadius = 15
        NSLayoutConstraint.activate([
            overlay.leadingAnchor.constraint(equalTo: imageView.leadingAnchor),
            overlay.topAnchor.constraint(equalTo: imageView.topAnchor),
            overlay.trailingAnchor.constraint(equalTo: imageView.trailingAnchor),
            overlay.bottomAnchor.constraint(equalTo: imageView.bottomAnchor)
            ])
    }
    
    private func setupLabels() {
        overlay.addSubviews(tripTitle, tripDate, tripEstimatedCost)
        NSLayoutConstraint.activate([
            tripDate.centerYAnchor.constraint(equalTo: overlay.centerYAnchor),
            tripDate.heightAnchor.constraint(equalToConstant: 25),
            tripDate.leadingAnchor.constraint(equalTo: overlay.leadingAnchor, constant: 15),
            tripDate.trailingAnchor.constraint(equalTo: overlay.trailingAnchor),
            
            tripEstimatedCost.topAnchor.constraint(equalTo: tripDate.bottomAnchor, constant: -5),
            tripEstimatedCost.leadingAnchor.constraint(equalTo: tripDate.leadingAnchor),
            tripEstimatedCost.trailingAnchor.constraint(equalTo: tripDate.trailingAnchor),
            tripEstimatedCost.heightAnchor.constraint(equalTo: tripDate.heightAnchor),
            
            tripTitle.bottomAnchor.constraint(equalTo: tripDate.topAnchor, constant: 3),
            tripTitle.leadingAnchor.constraint(equalTo: tripDate.leadingAnchor),
            tripTitle.trailingAnchor.constraint(equalTo: tripDate.trailingAnchor),
            tripTitle.heightAnchor.constraint(equalTo: tripDate.heightAnchor),
            ])
    }
}
