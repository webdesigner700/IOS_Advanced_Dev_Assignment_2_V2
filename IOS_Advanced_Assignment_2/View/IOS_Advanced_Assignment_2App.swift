//
//  IOS_Advanced_Assignment_2App.swift
//  IOS_Advanced_Assignment_2
//
//  Created by vinay bayyapunedi on 07/09/23.
//

import SwiftUI

@main
struct IOS_Advanced_Assignment_2App: App {
    
    // A StateObject called activityModelData is created that can be used to access the Activities array (created in the ModelData swift file) throughout all the views.
    
    @StateObject private var activityModelData = ActivityModelData()
    
    // A StateObject called accomodationModelData is created that can be used to access the Accomodations array (created in the ModelData swift file) throughout all the views.
    
    @StateObject private var accomodationModelData = AccomodationModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
            
                // The below 2 lines are used to provide access to the activityModelData and the accomodationModelData through the environment (the sub-views)
            
                .environmentObject(activityModelData)
                .environmentObject(accomodationModelData)
        }
    }
}
