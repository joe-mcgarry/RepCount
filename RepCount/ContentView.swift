//
//  ContentView.swift
//  RepCount
//
//  Created by Joe McGarry on 15/05/2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject var exercises = Exercises()
    @State private var showingAddExercise = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(exercises.workouts) { item in
                    Text(item.exerciseName)
                }
                .onDelete(perform: removeExercise)
            }
            .navigationTitle("RepCount")
            .toolbar {
                Button {
                    showingAddExercise = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showingAddExercise) {
                AddView(exercises: exercises)
            }
        }
    }
    
    func removeExercise(at offsets: IndexSet) {
        exercises.workouts.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
