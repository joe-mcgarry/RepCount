//
//  ContentView.swift
//  RepCount
//
//  Created by Joe McGarry on 15/05/2023.
//

import SwiftUI

struct ContentView: View {

    
    var body: some View {
        TabView {
            ExerciseView()
                .tabItem {
                    Label("Exercises", systemImage: "dumbbell")
                }
            
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person.circle")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
