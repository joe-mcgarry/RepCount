//
//  ExerciseView.swift
//  RepCount
//
//  Created by Joe McGarry on 12/07/2023.
//

import SwiftUI

struct ExerciseView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var exercises: FetchedResults<Exercise>

    @State private var showingAddExercise = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(exercises) { exercise in
                    NavigationLink {
                        Text(exercise.name ?? "Unknown exercise")
                    } label: {
                        HStack {
                            EmojiRatingView(rating: exercise.mood)
                                .font(.largeTitle)
                            
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
        for offfset in offsets {
            let exercise = exercises[offfset]
            moc.delete(exercise)
        }
        
        try? moc.save()
    }
}

struct ExerciseView_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseView()
    }
}
