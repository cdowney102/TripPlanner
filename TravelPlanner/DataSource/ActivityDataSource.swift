//
//  ActivityDataSource.swift
//  TravelPlanner
//
//  Created by christopher downey on 5/1/19.
//  Copyright © 2019 christopher downey. All rights reserved.
//

import Foundation
import UIKit

class ActivityDataSource: NSObject, UITableViewDataSource {
    
    var activities = [Activity]()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return activities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ActivityCell.identifier) as! ActivityCell
        return cell
    }
    
    func fetchActivityAtRow(_ row: Int) -> Activity {
        return activities[row]
    }
}
