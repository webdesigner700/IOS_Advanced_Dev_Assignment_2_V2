//
//  Activity.swift
//  IOS_Advanced_Assignment_2
//
//  Created by vinay bayyapunedi on 08/09/23.
//

import Foundation
import SwiftUI
import CoreLocation

// A struct named "Activity" that conforms to the Hashable, Codable and Identifiable Swift protocols is created.

struct Activity: Hashable, Codable, Identifiable {
    
    // The purpose of this Activity struct is to create a model that can hold data about a specific activity once data from the "ActivityData" JSON file is loaded into an array of the type Activity
    
    var id: Int // A unique identifier for each activity
    var name: String // The name of the activity
    var city: String // The city where the activity is located
    var state: String // The state where the activity is located
    var description: String // A description about the activity
    
    private var imageName: String // The name of the image associated with the activity
        
    // Computed property to create an "Image" View from the "imageName" property
    
    var image: Image {
        Image(imageName)
    }
    
    // A variable of the type "Coordinates" to hold the latitude and longitude coordinates of the activity
    
    private var coordinates: Coordinates
    
    // Computed property to convert 'coordinates" into a variable "activityCoordinate" of the type "CLLocationCoordinate2D"
    
    var activityCoordinate: CLLocationCoordinate2D {
            CLLocationCoordinate2D(
                latitude: coordinates.latitude,
                longitude: coordinates.longitude
            )
    }
    
    // A nested struct called "Coordinates" is created that represents the latitude and longitude of the activity. The variable "coordinates" on line 32 conforms to this structure
    
    struct Coordinates: Hashable, Codable {
        var latitude: Double
        var longitude: Double
    }
    
    var inItinerary: Bool // A Boolean indicating whether the activity is added to the Itinerary or not.
}
