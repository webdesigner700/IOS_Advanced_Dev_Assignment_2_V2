//
//  IOS_Advanced_Assignment_2App.swift
//  IOS_Advanced_Assignment_2
//
//  Created by vinay bayyapunedi on 07/09/23.
//

import SwiftUI

@main
struct IOS_Advanced_Assignment_2App: App {
    
    // In the below line, the StateObject property wrapper is used to create an instance of the final class ActivityModelData that can be used to access the Activities Array  by the SwiftUI Views in the Heirarchy.
    
    @StateObject private var activityModelData = ActivityModelData()
    
    // A StateObject property wrapper is used to create an instance of the final class AccomodationModelData that can be used to access the Accomodations Array by the SwiftUI views in the heirarchy.
    
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
