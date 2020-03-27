//
//  CalorieController.swift
//  Tracker
//
//  Created by Nick Nguyen on 3/27/20.
//  Copyright © 2020 Nick Nguyen. All rights reserved.
//

import Foundation
import CoreData
class CalorieController {
    
    func createNewItem(amount: Int64, date: Date = Date() ,into context : NSManagedObjectContext = CoreDataStack.shared.mainContext ) {
        let newItem = Calorie(context: context)
        newItem.amount = amount
        newItem.date = date
        do {
            try    CoreDataStack.shared.mainContext.save()
        } catch let err as NSError {
            NSLog("Error saving data to storage: \(err)")
        }
     
    }

    
}