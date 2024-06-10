//
//  ToDoAppApp.swift
//  ToDoApp
//
//  Created by Fatih Kenarda on 6.06.2024.
//

import SwiftUI

@main
struct ToDoAppApp: App {
    
    @StateObject var listViewModel: ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView{
                ContentView()
            }
            .environmentObject(listViewModel)
        }
    }
}
