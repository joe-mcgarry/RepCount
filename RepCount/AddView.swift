//
//  AddView.swift
//  RepCount
//
//  Created by Joe McGarry on 15/05/2023.
//

import SwiftUI

struct AddView: View {
    @ObservedObject var exercises: Exercises
    @Environment(\.dismiss) var dismiss
    
    @State private var exerciseName = ""
    @State private var category = ""
    @State private var amount = 0
    @State private var weight = 0.0
    
    let categories = ["Chest", "Arms", "Back", "Legs", "Abs"]
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Exercise", text: $exerciseName)
                
                Picker("Category", selection: $category) {
                    ForEach(categories, id: \.self) {
                        Text($0)
                    }
                }
                
                
                HStack {
                    Text("Reps:")
                    TextField("Reps", value: $amount, format: .number)
                        .keyboardType(.numberPad)
                }
                    
                
                HStack {
                    Text("Weight:")
                    TextField("Weight", value: $weight, format: .number)
                        .keyboardType(.decimalPad)
                }
            }
            .navigationTitle("Add exercise")
            .toolbar {
                Button("Save") {
                    let item = ExerciseItem(exerciseName: exerciseName, category: category, amount: amount, weight: weight)
                    exercises.workouts.append(item)
                    dismiss()
                }
            }
        }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(exercises: Exercises())
    }
}
