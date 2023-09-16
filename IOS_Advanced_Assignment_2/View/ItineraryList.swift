//
//  ItineraryList.swift
//  IOS_Advanced_Assignment_2
//
//  Created by vinay bayyapunedi on 08/09/23.
//

import SwiftUI

struct ItineraryList: View {
    
    // The variable activityModelData is accessed through the environment. This variable can be used to access the Published array "Activities" (defined in ModelData Swift file)
    
    @EnvironmentObject var activityModelData: ActivityModelData
    
    // the variable "filteredActivities" is a computed property used to filter activites on whether the "inItinerary" property is true or not. The array will only contain activities whose "inItinerary" property is true.
    
    var filteredActivities: [Activity] {
        
        activityModelData.Activities.filter {
            activity in (activity.inItinerary)
        }
    }
    
    
    var body: some View {
        
        NavigationView {
            
            if !filteredActivities.isEmpty {
                
                // Display the list of filteredActivities if there are any.
                
                // The "inItinerary" property of an activity turns true when the user switches between the "Add to Itinerary Toggle" in the Activity Detail screen
                
                // The custom list view is used to display the filtered array of activities in the form of an ActivitiyRow View.
                
                List(filteredActivities) {
                    activity in
                    ActivityRow(activity: activity)
                }
                .navigationTitle("Itinerary Activities")
            }
            else {
                
                // A message is displayed if no activites are added to the Itinerary
                
                Text("No Activities to display!")
                    .font(.headline)
                    .foregroundColor(.gray)
                    .padding()
                    .navigationBarTitle("Itinerary Activities")
            }
        }
    }
}

struct ItineraryList_Previews: PreviewProvider {
    static var previews: some View {
        ItineraryList()
            .environmentObject(ActivityModelData())
        
        // The preview is provided with the ActivityModelData() environment Object.
    }
}
