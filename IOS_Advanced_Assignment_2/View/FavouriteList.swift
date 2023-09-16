//
//  FavouriteList.swift
//  IOS_Advanced_Assignment_2
//
//  Created by vinay bayyapunedi on 13/09/23.
//

import SwiftUI

struct FavouriteList: View {
    
    // The variable accomodationModelData is accessed through the environment. This variable can be used to access the Published array "Accomodations" (defined in ModelData Swift file)
    
    @EnvironmentObject var accomodationModelData: AccomodationModelData
    
    // the variable "filteredAccomodations" is a computed property used to filter accomodations on whether the "inItinerary" property is true or not. The array will only contain accomodations whose "inItinerary" property is true.
    
    var filteredAccomodations: [Accomodation] {
        
        accomodationModelData.Accomodations.filter {
            accomodation in (accomodation.inItinerary)
        }
    }
    
    var body: some View {
        
        NavigationView {
            
            if !filteredAccomodations.isEmpty {
                
                // Display the list of filteredAccomodations if there are any.
                
                // The "inItinerary" property of an accomodation turns true when the user switches between the "Add to Itinerary Toggle" in the Accomodation Detail screen
                
                // The custom list view is used to display the filtered array of accomodations in the form of an AccomodationRow View.
                
                List(filteredAccomodations) {
                    accomodation in
                    AccomodationRow(accomodation: accomodation)
                }
                .navigationTitle("Favourites")
            }
            else {
                
                // A message is displayed if no accomodations are added to the Itinerary
                
                Text("No Favourite Accomodations to display!")
                    .font(.headline)
                    .foregroundColor(.gray)
                    .padding()
                    .navigationBarTitle("Favourites")
            }
        }
    }
}

struct FavouriteList_Previews: PreviewProvider {
    static var previews: some View {
        FavouriteList()
            .environmentObject(AccomodationModelData())
        
        // The preview is provided with the AccomodationModelData() environment Object.
    }
}
