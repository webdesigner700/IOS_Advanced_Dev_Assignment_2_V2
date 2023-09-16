//
//  ActivityDetail.swift
//  IOS_Advanced_Assignment_2
//
//  Created by vinay bayyapunedi on 08/09/23.
//

import SwiftUI

struct ActivityDetail: View {
    
    // The variable of the type ActivtyModelData is accessed through the environment. This variable "activityModelData" can be used to access the Published array Activities (defined in ModelData Swift file)
    
    
    @EnvironmentObject var activityModelData: ActivityModelData
    
    // The "activity" variable stores the activity sample data provided by the Preview Provider initializer.
    
    var activity: Activity
    
    var activityIndex: Int? {
        
        if let index = activityModelData.Activities.firstIndex(where: { $0.id == activity.id}) {
            return index
        }
        else {
            
            // The else case handles the case where no match for the index is found
            
            return nil
        }
        
        // This computes the index of the "activity" variable by comparing it to the activityModelData activity array
        
        // The closure { $0.id == activity.id} checks if the "id" property of the "activity" variable matches the id property of any of the activity elements in the activityModelData.Activities array.
    }
    
    
    var body: some View {
            
        NavigationStack {
            
            VStack {
                
                // A map is displayed using the custom MapView component. This custom view is created in the "MapView" SwiftUI file. The parameter values provided for MapView are obtained from the "activity" variable
                
                MapView(coordinate: activity.activityCoordinate)
                    .frame(height: 200)
                    .cornerRadius(16)
                    .ignoresSafeArea(edges: .top)
                
                // An image is displayed using the custom ImageView component. The imageView component takes in a parameter of the type "Image". The name for this parameter type is provided by the "activity" variable. The various modifiers used to display the image can be accessed through the ImageView SwiftUI file.
                
                ImageView(image: activity.image)
                    .offset(y: -120)
                    .padding(.bottom, -120)
                
                // The VStack below shows the name of the activty, the city and the state the activity is in.
                
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
                
                
                // This Toggle allows the user to add or remove an acitivity from their itinerary. The Toggle's state (isOn) is bound to the "inItinerary' property of the corresponsing activity in the activityModelData's Activities array. The activity in the array Activities in which the "inItinerary" preoperty should be toggled is foudn using the activityIndex variable defined on line 21
                
                Toggle(isOn: $activityModelData.Activities[activityIndex ?? 0].inItinerary) {
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
                )
                
                // The below VStack displays the description section of the activity
                
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
    
    // A static instance of the ActivityModelData class is created for the preview.
    
    static let activityModelData = ActivityModelData()
    
    static var previews: some View {
        ActivityDetail(activity: activityModelData.Activities[0])
            .environmentObject(activityModelData)
        
        // The preview is provided with an activity from the array Activities which is accessed through the static instance variable "activityModelData".
    }
}
