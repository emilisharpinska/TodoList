//
//  TodoListApp.swift
//  TodoList
//
//  Created by Emili Sharpinska on 25/02/2026.
//

import SwiftUI

@main

/*
   MVVM Arcitecture
 
 Model - data point
 View - UI
 ViewModel - manages Models for View
 */

struct TodoListApp: App {
    
    @StateObject var listViewModel: ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView{
                ListView()
            }
            .navigationViewStyle(StackNavigationViewStyle())
            .environmentObject(listViewModel)
        }
    }
}
