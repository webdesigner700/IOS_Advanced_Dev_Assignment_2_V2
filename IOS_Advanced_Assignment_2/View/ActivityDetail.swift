//
//  ActivityDetail.swift
//  IOS_Advanced_Assignment_2
//
//  Created by vinay bayyapunedi on 08/09/23.
//

import SwiftUI

struct ActivityDetail: View {
    
    // This is a mutable property and it is used as a source of truth within a view. When the value of the @State property changes, SwiftUI automatically updates the view, ensuring it reflects the most recent data.
    
    @EnvironmentObject var activityModelData: ActivityModelData
    
    // The array of activities is received from the ModelData without having to explicitly initlaize the activity array in the preview initializer.
    
    var activity: Activity
    
    var activityIndex: Int {
        
        activityModelData.Activities.firstIndex(where: { $0.id == activity.id})!
        
        // This computes the index of the input activity by comparing it to the modelData activity array
        
        // The closure { $0.id == activity.id} checks if the "id" property of the activity elemnt matches the id property of any of the activity elewments in the modelData activity array.
        
        // ! forcefully unwraps the result of "firstIndex(where:). It assumes there is always an element in the array that satisfies the given condition.
    }
    
    
    var body: some View {
        
        NavigationStack {
            
            VStack {
                
                MapView(coordinate: activity.activityCoordinate)
                    .frame(height: 300)
                    .ignoresSafeArea(edges: .top)
                
                ImageView(image: activity.image)
                    .offset(y: -120)
                    .padding(.bottom, -130)
                
                VStack() {
                    
                    Text(activity.name)
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(.vertical, 9.0)
                    
                    HStack {
                        Text(activity.city)
                            .font(.title2)
                        
                        Spacer()
                        
                        Text(activity.state)
                            .font(.title2)
                        
                    }
                    .padding()
                }
                
                //Just add a toggle switch here. When it is turned on, the activity gets added to the itinerary list

                Toggle("Add to Itinerary", isOn: $activityModelData.Activities[activityIndex].inItinerary)
                    .padding()
                
                
                // The isOn property of the Toggle is binded to the inItinerary property of the modelData Activity array
                
                
                VStack(alignment: .leading) {
                    
                    Text("Description")
                        .font(.title3)
                        .multilineTextAlignment(.center)
                    
                    
                    Text(activity.description)
                        .font(.body)
                }
                .padding()
            }
        }
    }
}

struct ActivityDetail_Previews: PreviewProvider {
    
    static let activityModelData = ActivityModelData()
    
    static var previews: some View {
        ActivityDetail(activity: activityModelData.Activities[0])
            .environmentObject(activityModelData)
    }
}
