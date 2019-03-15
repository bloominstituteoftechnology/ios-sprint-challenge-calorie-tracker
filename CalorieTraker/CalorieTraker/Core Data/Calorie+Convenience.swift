//
//  Calorie+Convenience.swift
//  CalorieTraker
//
//  Created by Jocelyn Stuart on 3/15/19.
//  Copyright © 2019 JS. All rights reserved.
//

import Foundation
import CoreData

extension Calorie {
    
    @discardableResult
    convenience init(amount: Int64, timestamp: Date = Date(),
                     context: NSManagedObjectContext = CoreDataStack.shared.mainContext) {
        
        self.init(context: context)
        self.amount = amount
        self.timestamp = timestamp
       
    }
    
    @discardableResult
    convenience init?(calorieRep: CalorieRepresentation, context: NSManagedObjectContext) {
        
        self.init(amount: calorieRep.amount, timestamp: calorieRep.timestamp, context: context)
    }

}
