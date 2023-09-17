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
    
    // If a variable has the State property, SwiftUI will understand that it has to be aware of any changes that can be made to the variable/property.
    
    var body: some View {
        
        // A Map view is created using the "coordinateRegion" property which is binded to the "region" State variable.
        
        Map(coordinateRegion: $region)
            .onAppear() {
                setRegion(coordinate)
            }
        
        // The "region" state variable is modified in the view modifier function "onAppear". Everytime the region coordinates change, the onAppear modifier trigggers a calculation of the region based on the current coordinate.
    }
    
    // This private function "setRegion" updates the State variable "region" based on the center coordinate and a specified span.
    
    private func setRegion(_ coordinate: CLLocationCoordinate2D) {
            region = MKCoordinateRegion(
                center: coordinate,
                span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
            )
    }
    
    // The "setRegion" function updates the region based on a coordinate value passed in as a parameter
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(coordinate: CLLocationCoordinate2D(latitude: 37.773972, longitude: -122.431297))
        
        // A preview of the "MapView" with a sample coordinate in Joshua Tree national park is shown
    }
}
