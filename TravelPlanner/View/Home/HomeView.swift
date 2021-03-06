//
//  HomeView.swift
//  TravelPlanner
//
//  Created by christopher downey on 4/28/19.
//  Copyright © 2019 christopher downey. All rights reserved.
//

import Foundation
import UIKit

class HomeView: UIView {
    
    lazy var header = Header(frame: CGRect(x: 0, y: 0, width: frame.width, height: frame.height * 0.17))
    private var emptyView = EmptyView(frame: .zero)
    var didSelect: ((_ trip: Trip) -> ())?
    let dataSource = TripsDataSource()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .backgroundGray
        setupHeader()
        setupTrips()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var collectionView: UICollectionView = {
       let cv = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.dataSource = dataSource
        cv.delegate = self
        cv.register(TripCell.self, forCellWithReuseIdentifier: TripCell.identifier)
        cv.showsVerticalScrollIndicator = false
        cv.backgroundColor = .backgroundGray
        return cv
    }()
}

extension HomeView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let trip = dataSource.fetchTripAtIndex(indexPath.item)
        collectionView.cellForItem(at: indexPath)?.fireTapAnimation { [ weak self ] in
            guard let strongSelf = self else { return }
            strongSelf.didSelect?(trip)
        }
    }
}

extension HomeView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: frame.width - 50, height: 100)
    }
}

extension HomeView {
    func checkIfEmpty() {
        if dataSource.trips.isEmpty {
            showEmptyView()
        } else {
            removeEmptyView()
        }
    }
    
    private func showEmptyView() {
        addSubview(emptyView)
        NSLayoutConstraint.activate([
            emptyView.topAnchor.constraint(equalTo: header.bottomAnchor),
            emptyView.leadingAnchor.constraint(equalTo: leadingAnchor),
            emptyView.trailingAnchor.constraint(equalTo: trailingAnchor),
            emptyView.bottomAnchor.constraint(equalTo: bottomAnchor)
            ])
    }
    
    private func removeEmptyView() {
        emptyView.removeFromSuperview()
    }
    
    private func setupHeader() {
        header.homeHeader = true
        header.setupUI(destination: "My Trips", tripName: "Where to next?", estCost: "", btnType: .add, color: .pastelAqua)
        addSubview(header)
    }
    
    private func setupTrips() {
        addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.topAnchor.constraint(equalTo: header.bottomAnchor, constant: 15),
            collectionView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
            ])
    }
    
    private func setupEmptyView() {
        addSubview(emptyView)
        NSLayoutConstraint.activate([
            emptyView.leadingAnchor.constraint(equalTo: leadingAnchor),
            emptyView.trailingAnchor.constraint(equalTo: trailingAnchor),
            emptyView.topAnchor.constraint(equalTo: header.bottomAnchor),
            emptyView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
            ])
    }
    
    func setTotalCost() {
        // sum the total cost to spend on all trips combined
        let estimatedCost = dataSource.trips.map { Int($0.estimatedCost.replacingOccurrences(of: "$", with: "")) ?? 0 }.reduce(0, +)
        header.estimatedCostLabel.text = "$\(String(describing: estimatedCost))"
    }
}
