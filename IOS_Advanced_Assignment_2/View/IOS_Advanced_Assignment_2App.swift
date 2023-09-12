//
//  IOS_Advanced_Assignment_2App.swift
//  IOS_Advanced_Assignment_2
//
//  Created by vinay bayyapunedi on 07/09/23.
//

import SwiftUI

@main
struct IOS_Advanced_Assignment_2App: App {
    
    @StateObject private var activityModelData = ActivityModelData()
    
    @StateObject private var accomodationModelData = AccomodationModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(activityModelData)
                .environmentObject(accomodationModelData)
        }
    }
}
