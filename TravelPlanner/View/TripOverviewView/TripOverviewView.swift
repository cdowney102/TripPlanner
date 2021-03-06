//
//  UpdateView.swift
//  TravelPlanner
//
//  Created by christopher downey on 5/1/19.
//  Copyright © 2019 christopher downey. All rights reserved.
//

import Foundation
import UIKit

class TripOverviewView: UIView {
    
    lazy var header = Header(frame: CGRect(x: 0, y: 0, width: frame.width, height: frame.height * 0.17))
    var addButton: UIButton = ButtonFactory(image: UIImage(named: "pinkadd.png")!).build()
    var didSelectTripAt: ((_ row: Int) -> ())?
    let dataSource = ActivityDataSource()
    var addBtnAction: (() -> Void)?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setupHeader()
        setupButton()
        setupTableView()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var tableView: UITableView = {
        let tv = UITableView(frame: .zero)
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.showsVerticalScrollIndicator = false
        tv.dataSource = dataSource
        tv.delegate = self
        tv.register(ActivityCell.self, forCellReuseIdentifier: ActivityCell.identifier)
        return tv
    }()
}

extension TripOverviewView {
    private func setupHeader() {
        addSubview(header)
    }
    
    private func setupTableView() {
        addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.topAnchor.constraint(equalTo: header.bottomAnchor),
            tableView.bottomAnchor.constraint(equalTo: addButton.topAnchor)
            ])
    }
    
    private func setupButton() {
        addButton.addTarget(self, action: #selector(addTapped), for: .touchUpInside)
        addSubview(addButton)
        NSLayoutConstraint.activate([
            addButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            addButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -25),
            addButton.heightAnchor.constraint(equalToConstant: 60),
            addButton.widthAnchor.constraint(equalToConstant: 60)
            ])
    }
    
    @objc private func addTapped() {
        addButton.fireTapAnimation { [ weak self ] in
            guard let strongSelf = self else { return }
            strongSelf.addBtnAction?()
        }
    }
}

extension TripOverviewView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        didSelectTripAt?(indexPath.row)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }
}




