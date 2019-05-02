//
//  UpdateView.swift
//  TravelPlanner
//
//  Created by christopher downey on 5/1/19.
//  Copyright © 2019 christopher downey. All rights reserved.
//

import Foundation
import UIKit

class UpdateView: UIView {
    
    lazy var header = Header(frame: CGRect(x: 0, y: 0, width: frame.width, height: frame.height * 0.17))
    let dataSource = ActivityDataSource()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupHeader()
        setupTableView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var tableView: UITableView = {
        let tv = UITableView(frame: .zero)
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.dataSource = dataSource
        tv.delegate = self
        tv.register(ActivityCell.self, forCellReuseIdentifier: ActivityCell.identifier)
        return tv
    }()
}

extension UpdateView {
    private func setupHeader() {
        header.setupUI("Los Angeles", "Sept 9 - 11", "$122")
        addSubview(header)
    }
    
    private func setupTableView() {
        addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.topAnchor.constraint(equalTo: header.bottomAnchor),
            tableView.heightAnchor.constraint(equalToConstant: frame.height / 2)
            #warning("this will be pinned to the button at bottom instead of height")
            ])
    }
}

extension UpdateView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let activity = dataSource.fetchActivityAtRow(indexPath.row)
        print(activity)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }
}




