//
//  ContentView.swift
//  RepCount
//
//  Created by Joe McGarry on 15/05/2023.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var exercises: FetchedResults<Exercise>

    @State private var showingAddExercise = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(exercises) { exercise in
                    NavigationLink {
                        Text("Hello")
                    } label: {
                        HStack {
                            VStack(alignment: .leading) {
                                Text(exercise.name ?? "Unknown Exercise")
                                    .font(.headline)
                                Text(exercise.category ?? "Unknown Category")
                                    .foregroundColor(.secondary)
                            }
                        }
                    }
                }
                .onDelete(perform: removeExercise)
            }
            .navigationTitle("RepCount")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showingAddExercise = true
                    } label: {
                        Label("Add Exercise", systemImage: "plus")
                    }
                }
            }
            .sheet(isPresented: $showingAddExercise) {
                AddExerciseView()
            }
        }
    }
    
    func removeExercise(at offsets: IndexSet) {
        //Delete a workout
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
