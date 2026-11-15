//
//  ContentView.swift
//  FoodApp
//
//  Created by Saif Ahmad on 06/11/26.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    @StateObject private var authController = AuthController()
   

    var body: some View {
        Group{
            if authController.user == nil {
                LaunchScreen()
            }
            else{
                HomeScreenController()
                
            }
        }
        .environmentObject(authController)
         
        
    }
   

   
}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
