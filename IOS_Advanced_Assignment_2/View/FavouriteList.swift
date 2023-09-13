//
//  FavouriteList.swift
//  IOS_Advanced_Assignment_2
//
//  Created by vinay bayyapunedi on 13/09/23.
//

import SwiftUI

struct FavouriteList: View {
    
    @EnvironmentObject var accomodationModelData: AccomodationModelData
    
    var filteredAccomodations: [Accomodation] {
        
        accomodationModelData.Accomodations.filter {
            accomodation in (accomodation.inItinerary)
        }
    }
    
    var body: some View {
        
        NavigationView {
            
            if !filteredAccomodations.isEmpty {
                
                List(filteredAccomodations) {
                    accomodation in
                    AccomodationRow(accomodation: accomodation)
                }
                .navigationTitle("Favourites")
            }
            else {
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
    }
}
