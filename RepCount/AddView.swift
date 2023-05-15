//
//  AddView.swift
//  RepCount
//
//  Created by Joe McGarry on 15/05/2023.
//

import SwiftUI

struct AddView: View {
    @ObservedObject var exercises: Exercises
    
    @State private var exerciseName = ""
    @State private var category = ""
    @State private var amount = 0
    @State private var weight = Measurement(value: 10, unit: UnitMass.kilograms)
    
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
                
                TextField("Reps", value: $amount, format: .number)
                    .keyboardType(.numberPad)
                
                TextField("Weight", value: $weight, formatter: MassFormatter())
                    .keyboardType(.decimalPad)
            }
            .navigationTitle("Add exercise")
        }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(exercises: Exercises())
    }
}
