//
//  AddView.swift
//  RepCount
//
//  Created by Joe McGarry on 15/05/2023.
//

import SwiftUI

struct AddView: View {
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
                    
                    Picker("How was the session?", selection: $moodAfter) {
                        ForEach(0..<6) {
                            Text(String($0))
                        }
                    }
                } header: {
                    Text("Leave a note about the exercise")
                }
                
                Section {
                    Button("Save") {
                        //Add the exercise
                    }
                }
            }
            .navigationTitle("Add exercise")
        }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView()
    }
}
