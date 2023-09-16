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
                    .frame(height: 200)
                    .cornerRadius(16)
                    .ignoresSafeArea(edges: .top)
    
                // When the frame height is decreasing, the height of the map is decreasing from the top and not from the bottom
                
                ImageView(image: activity.image)
                    .offset(y: -120)
                    .padding(.bottom, -120)
                    // This padding value is not affecting anything.
                
                VStack() {
                    
                    Text(activity.name)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding(.vertical, 5)
                    
                    HStack {
                        Text(activity.city)
                            .font(.headline)
                        
                        Spacer()
                        
                        Text(activity.state)
                            .font(.headline)
                        
                    }
                    .padding([.leading, .bottom, .trailing], 12)
                }
                .padding(.horizontal, 16)
                
                
                //Just add a toggle switch here. When it is turned on, the activity gets added to the itinerary list

                Toggle(isOn: $activityModelData.Activities[activityIndex].inItinerary) {
                    Text("Add to Itinerary")
                        .fontWeight(.semibold)
                        .padding(.horizontal, 16)
                }
                .padding(.horizontal, 22)
                .padding(.vertical, 8)
                .background(
                    Rectangle()
                        .stroke(Color.blue, lineWidth: 2) // Stroke style
                        .padding(.horizontal, 16)
                    ) // IMPROVE THIS
                
                
                // The isOn property of the Toggle is binded to the inItinerary property of the modelData Activity array
                
                
                VStack(alignment: .leading, spacing: 8) {
                    
                    Text("Description")
                        .font(.title3)
                        .multilineTextAlignment(.center)
                    
                    
                    Text(activity.description)
                        .font(.body)
                }
                .padding()
                .background(
                    Rectangle()
                        .fill(Color(hue: 0.678, saturation: 0.08, brightness: 0.861)) // Stroke style
                )
                
            }
            .navigationBarTitle("Activity Details", displayMode: .inline)
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
