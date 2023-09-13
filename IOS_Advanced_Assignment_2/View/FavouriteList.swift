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
            
            List(filteredAccomodations) {
                accomodation in
                AccomodationRow(accomodation: accomodation)
            }
            .navigationTitle("Favourite Accomodations")
        }
    }
}

struct FavouriteList_Previews: PreviewProvider {
    static var previews: some View {
        FavouriteList()
            .environmentObject(AccomodationModelData())
    }
}
