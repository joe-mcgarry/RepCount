//
//  RepItem.swift
//  RepCount
//
//  Created by Joe McGarry on 15/05/2023.
//

import Foundation

struct ExerciseItem: Identifiable {
    var id = UUID()
    let exerciseName: String
    let category: String
    let amount: Int
    let weight: Double
}
