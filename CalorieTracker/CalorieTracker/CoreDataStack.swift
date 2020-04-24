//
//  CoreDataStack.swift
//  CalorieTracker
//
//  Created by Tobi Kuyoro on 24/04/2020.
//  Copyright © 2020 Tobi Kuyoro. All rights reserved.
//

import Foundation
import CoreData

class CoreDataStack {

    static let shared = CoreDataStack()

    private init() {}

    lazy var container: NSPersistentContainer = {

        let container = NSPersistentContainer(name: "Password")

        container.loadPersistentStores(completionHandler: { _, error in
            if let error = error {
                fatalError("Error loading Persistent Stores: \(error)")
            }
        })
        container.viewContext.automaticallyMergesChangesFromParent = true
        return container
    }()

    var mainContext: NSManagedObjectContext {
        return container.viewContext
    }

    func save(context: NSManagedObjectContext = CoreDataStack.shared.mainContext) throws {
        var error: Error?

        context.performAndWait {
            do {
                try context.save()
            } catch let saveError {
                NSLog("Error saving context \(saveError)")
                error = saveError
            }
        }

        if error != nil {
            throw error!
        }
    }
}
