//
//  Accomodation.swift
//  IOS_Advanced_Assignment_2
//
//  Created by vinay bayyapunedi on 09/09/23.
//

import Foundation
import SwiftUI
import CoreLocation

// A struct named "Accomodation" that conforms to the Hashable, Codable and Identifiable Swift protocols is created.

struct Accomodation: Hashable, Codable, Identifiable {
    
    // The purpose of this Accomodation struct is to create a model that can hold data about a specific accomodation once data from the "AccomodationData" JSON file is loaded into an array of the type Accomodation
    
    var id: Int // A unique identifier for each Accomodation
    var name: String // The name of the accomodation
    var district: String // The city ewhere the accomodation is located
    var city: String // The state where the accomodation is located
    var description: String // A description about the accomodation
    
    private var imageName: String // The name of the image associated wqith the accomodation
    
    // Computed property to create an "Image" View from the "imageName" property
    
    var image: Image {
        Image(imageName)
    }
    
    // A variable of the type "Coordinates" to hold the latitude and longitude coordinates of the accomodation
    
    private var coordinates: Coordinates
    
    // Computed property to convert 'coordinates" into a variable "accomodationCoordinate" of the type "CLLocationCoordinate2D"
    
    var accomodationCoordinate: CLLocationCoordinate2D {
            CLLocationCoordinate2D(
                latitude: coordinates.latitude,
                longitude: coordinates.longitude
            )
    }
    
    // A nested struct called "Coordinates" is created that represents the latitude and longitude of the accomodation. The variable "coordinates" on line 32 conforms to this structure
    
    struct Coordinates: Hashable, Codable {
        var latitude: Double
        var longitude: Double
    }
    
    var inItinerary: Bool // A Boolean indicating whether the accomodation is added to the Itinerary or not.
}
