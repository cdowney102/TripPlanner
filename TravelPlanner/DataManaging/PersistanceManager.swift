//
//  DBManager.swift
//  TravelPlanner
//
//  Created by christopher downey on 4/29/19.
//  Copyright © 2019 christopher downey. All rights reserved.
//

import Foundation
import UIKit
import CoreData

final class PersistanceManager {
    
    private init(){}
    static let shared = PersistanceManager()
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "TravelPlanner")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    lazy var context = persistentContainer.viewContext
    
    // MARK: - Core Data Saving support
    func save() {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}


