//
//  AddView.swift
//  RepCount
//
//  Created by Joe McGarry on 15/05/2023.
//

import SwiftUI

struct AddExerciseView: View {
    @Environment(\.managedObjectContext) var moc
    @Environment(\.dismiss) var dismiss
    
    @State private var name = ""
    @State private var category = ""
    @State private var amount = 0
    @State private var weight = 0.0
    @State private var moodAfter = 3
    @State private var notes = ""
    
    let categories = ["Chest", "Arms", "Back", "Legs", "Abs", "Cardio"]
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Exercise", text: $name)
                }
                
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
                
                Section {
                    TextEditor(text: $notes)
                    RatingView(rating: $moodAfter)
                } header: {
                    Text("Leave a note about the exercise")
                }
                
                Section {
                    Button("Save") {
                        let newExercise = Exercise(context: moc)
                        newExercise.id = UUID()
                        newExercise.name = name
                        newExercise.category = category
                        newExercise.reps = Int16(amount)
                        newExercise.weight = weight
                        newExercise.notes = notes
                        newExercise.mood = Int16(moodAfter)
                        
                        try? moc.save()
                        dismiss()
                    }
                }
            }
            .navigationTitle("Add exercise")
        }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddExerciseView()
    }
}
