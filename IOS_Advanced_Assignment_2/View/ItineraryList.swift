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
        
      
        List(filteredActivities) {
            Activity in
                ActivityRow(activity: Activity)
            
        }
        
    }
}

struct ItineraryList_Previews: PreviewProvider {
    static var previews: some View {
        ItineraryList()
            .environmentObject(ActivityModelData())
    }
}

// Usa a toggle switch to represent whether a user has added an activity to their itinerary list. 
