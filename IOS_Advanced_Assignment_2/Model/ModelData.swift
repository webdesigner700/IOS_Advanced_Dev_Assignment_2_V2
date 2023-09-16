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
    
    // The Activiites array is creates as a Published variable so that all the views in the heirarchy will be notified if any changed take place with the Activities array members.
    
    // The load fucntion is use to load the activity data from the JSON file "ActivityData" 
    
    @Published var Activities: [Activity] = load("ActivityData.json")
    
    // Changes to the Published variable is automatically tracked
}

final class AccomodationModelData: ObservableObject {
    
    @Published var Accomodations: [Accomodation] = load("AccomodationData.json")
}





func load<T: Decodable>(_ filename: String) -> T {
    let data: Data


    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }


    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }


    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
