//
//  ItineraryList.swift
//  IOS_Advanced_Assignment_2
//
//  Created by vinay bayyapunedi on 08/09/23.
//

import SwiftUI

struct ItineraryList: View {
    
    
    @EnvironmentObject var activityModelData: ActivityModelData
    
    var filteredActivities: [Activity] {
        
        activityModelData.Activities.filter {
            activity in (activity.inItinerary)
        }
    }
    
    
    var body: some View {
        
        NavigationView {
            
            List(filteredActivities) {
                activity in
                ActivityRow(activity: activity)
            }
            .navigationTitle("Itinerary Activities")
        }
    }
    
    func inItinerary(accomodation: Accomodation) -> Bool {
        
        
        if accomodation.inItinerary == true {
            
            return true
        }
        
        return false
    }
}
    
    // Instead of this make a function which whether the inItinerary property is true or not for the given accomodation parameter

struct ItineraryList_Previews: PreviewProvider {
    static var previews: some View {
        ItineraryList()
            .environmentObject(ActivityModelData())
    }
}

// Use a toggle switch to represent whether a user has added an activity to their itinerary list.
