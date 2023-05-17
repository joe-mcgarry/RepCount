//
//  Reps.swift
//  RepCount
//
//  Created by Joe McGarry on 15/05/2023.
//

import Foundation

class Exercises: ObservableObject {
    @Published var workouts = [ExerciseItem]() {
        didSet {
            if let encoded = try? JSONEncoder().encode(workouts) {
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }
    
    init() {
        if let savedItems = UserDefaults.standard.data(forKey: "Items") {
            if let decodedItems = try? JSONDecoder().decode([ExerciseItem].self, from: savedItems) {
                workouts = decodedItems
                return
            }
        }
        
        workouts = []
    }
}
