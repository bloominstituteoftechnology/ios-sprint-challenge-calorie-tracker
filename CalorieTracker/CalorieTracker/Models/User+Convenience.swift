//
//  User+Convenience.swift
//  CalorieTracker
//
//  Created by Luqmaan Khan on 9/20/19.
//  Copyright © 2019 Luqmaan Khan. All rights reserved.
//

import Foundation
import CoreData

extension User {
    
    convenience init(calories: String, timestamp: Date, context: NSManagedObjectContext = CoreDataStack.shared.mainContext) {
        self.init(context: context)
        self.calories = calories
        self.timestamp = timestamp
    }
}
