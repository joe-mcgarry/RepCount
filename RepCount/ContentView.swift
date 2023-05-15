//
//  ContentView.swift
//  RepCount
//
//  Created by Joe McGarry on 15/05/2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject var exercises = Exercises()
    var body: some View {
        NavigationView {
            List {
                ForEach(exercises.workouts, id: \.exerciseName) { item in
                    Text(item.exerciseName)
                }
                .onDelete(perform: removeExercise)
            }
            .navigationTitle("RepCount")
            .toolbar {
                Button {
                    let exercise = ExerciseItem(exerciseName: "Test", category: "Test", amount: 5, weight: 35)
                    exercises.workouts.append(exercise)
                } label: {
                    Image(systemName: "plus")
                }
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
