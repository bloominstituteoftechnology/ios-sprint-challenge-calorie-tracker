//
//  UserRepresentation.swift
//  CalorieTracker
//
//  Created by Sammy Alvarado on 10/12/20.
//

import Foundation

struct UserRepresentation: Codable {
    var id: String
    var calories: Double
    var time: Date
}
