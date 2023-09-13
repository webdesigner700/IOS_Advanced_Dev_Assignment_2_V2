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
        
        TabView {
            LocationDetail()
                .tabItem() {
                    Image(systemName: "house.circle")
                    Text("Home")
                }
            ItineraryList()
                .tabItem() {
                    Image(systemName: "location.circle.fill")
                    Text("Itinerary")
                }
            FavouriteList()
                .tabItem() {
                    Image(systemName: "star.circle")
                    Text("Favorites")
                }
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
        
        // The environment objects provided to the Preview provider are of the class type.
    }
}
