//
//  ContentView.swift
//  IOS_Advanced_Assignment_2
//
//  Created by vinay bayyapunedi on 07/09/23.
//

import SwiftUI
import MapKit

struct ContentView: View {
    
    var body: some View {
        
        // A tabview is created to organize and provide the user access to the important views.
        
        TabView {
            
            // The Home page will contain information about San Francisco (LocationDetail SwiftUI file)
            
            LocationDetail()
                .tabItem() {
                    Image(systemName: "house.circle")
                    Text("Home")
                }
            
            // The Itinerary page will contain the san francisco activities added by the user to their itinerary (ItineraryList file)
            
            ItineraryList()
                .tabItem() {
                    Image(systemName: "location.circle.fill")
                    Text("Itinerary")
                }
            
            // The Favourites page will contain the san francisco accomodations added by the user to their favourites list.
            
            FavouriteList()
                .tabItem() {
                    Image(systemName: "star.circle")
                    Text("Favorites")
                }
            
            // The Accomodation page will contain information about the various san Francisco accomodations that the user can choose to stay in
            
            AccomodationList()
                .tabItem() {
                    Image(systemName: "bed.double")
                    Text("Accomodation")
                }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ActivityModelData())
            .environmentObject(AccomodationModelData())
        
            // The preview is provided with environment objects of the type AcvitiyModelData and AccomodationModelData. This data will be privided down to the sub-views. 
        
        // The environment objects provided to the Preview provider are of the class type.
    }
}
