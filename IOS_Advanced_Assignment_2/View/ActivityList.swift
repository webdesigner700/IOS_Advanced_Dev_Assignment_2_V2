//
//  ActivityList.swift
//  IOS_Advanced_Assignment_2
//
//  Created by vinay bayyapunedi on 08/09/23.
//

import SwiftUI

struct ActivityList: View {
    
    // The activityModelData instance of the final class ActivityModelData is accessed here through the environment as the StateObject property wrapper is used to define the actiivtyModelData instance in the Swift UI file "IOS_Advanced_Assignment_2App".
    
    @EnvironmentObject var activityModelData: ActivityModelData
    
    var body: some View {
        
        // A NavigationStack is created to manage navigations to the ActivityDetail Views.
        
        NavigationStack {
            
            // Here, a custom List View is used to display the array of activities from the Activites array. This Activities Array is accessed from the EnviironmentObject activityModelData. For each item in the Activities array, The NavigationLink to the ActivityDetail view is defined and the label which is the ActivityRow view is defined.
            
            // Both the ActivityRow and ActivityDetail views require an activity element from the Activities Array as an initializer.
            
            List(activityModelData.Activities) { Activity in
                
                NavigationLink(destination: ActivityDetail(activity: Activity), label: {
                    ActivityRow(activity: Activity)
                })
            }
            .navigationTitle("Activities")
            
            // The navigation Title is set.
        }
    }
}

struct ActivityList_Previews: PreviewProvider {
    
    // A static instance of the activityModelData object is created for the Preview.
    
    static let activityModelData = ActivityModelData()
    
    static var previews: some View {
        ActivityList()
            .environmentObject(ActivityModelData())
        
        // The preview is provided with the ActivityModelData() environment Object.
    }
}
