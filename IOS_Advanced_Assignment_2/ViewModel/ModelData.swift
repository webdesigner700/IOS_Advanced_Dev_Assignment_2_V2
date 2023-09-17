//
//  ModelData.swift
//  IOS_Advanced_Assignment_2
//
//  Created by vinay bayyapunedi on 08/09/23.
//

import Foundation
import Combine


// A swift class called ActivityModelData is defined to provide an array of Activities to all the views in the heirarchy.

final class ActivityModelData: ObservableObject {
    
    // The Activiites array is created as a Published variable so that all the views in the heirarchy will be notified if any changes take place with the Activities array members.
    
    // The load fucntion is used to load the activity data from the JSON file "ActivityData". The data from the JSON file is converted into SwiftUI objects that conforms to the Array type. In this case, the array type is "Activity" which is a structure defined in the "Activity" Swift file.
    
    @Published var Activities: [Activity] = load("ActivityData.json")
    
    // Changes to the Published variable is automatically tracked
}

// A swift class called AccomodationModelData is defined to provide an array of Activities to all the views in the heirarchy

final class AccomodationModelData: ObservableObject {
    
    // The Accomodations array is created as a Published variable so that all the views in the heirarchy will be notified if any changes take place with the Accomodations array members
    
    // The load function is used to load the accomodation data from the JSON file "AccomodationData". The data from the JSON file is converted into SwiftUI objects that conforms to the Array type. In this case, the array type is "Accomodation" which is a structure defined in the "Accomodation" Swift file.
    
    @Published var Accomodations: [Accomodation] = load("AccomodationData.json")
    
    // Changes to the Published variable is automatically tracked
}



// The load function loads data from a JSON file and decodes it into the specified type.

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data

    // Try to find the URL of the specified filename in the main bundle
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }


    do {
        // Read the contents of the file into a Data object
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }


    do {
        // Create a JSON decoder and decode the Data into the specified generic type T.
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
