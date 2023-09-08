//
//  MapView.swift
//  IOS_Advanced_Assignment_2
//
//  Created by vinay bayyapunedi on 08/09/23.
//

import SwiftUI
import MapKit

struct MapView: View {
    
    var coordinate: CLLocationCoordinate2D
    
    // In the above line, a coordinate property is declared and a varibale of the same name is initialized in the preview provider.
    
    @State private var region = MKCoordinateRegion()
    
    // A private State variable is created that holds the region information for the map
    
    // If a variable ahs the State property, SwiftUI will understand that it has to be aware of any changes that can be made to the variable/property.
    
    var body: some View {
        
        Map(coordinateRegion: $region)
            .onAppear() {
                setRegion(coordinate)
            }
        
        // The "region" state variable is modified in the view modifier function "onAppear". Everytime the region coordinates change, the onAppear modifier trigggers a calculation of the region based on the current coordinate.
    }
    
    private func setRegion(_ coordinate: CLLocationCoordinate2D) {
            region = MKCoordinateRegion(
                center: coordinate,
                span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
            )
    }
    
    // The "setRegion" function updates the region based on a coordinatee value passed in as a parameter
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(coordinate: CLLocationCoordinate2D(latitude: 34.011_286, longitude: -116.166_868))
    }
}
