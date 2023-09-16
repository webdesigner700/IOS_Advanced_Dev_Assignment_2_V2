//
//  AccomodationList.swift
//  IOS_Advanced_Assignment_2
//
//  Created by vinay bayyapunedi on 09/09/23.
//

import SwiftUI

struct AccomodationList: View {
    
    // The varibale accomodationModelData is accessed through the environment. This variable can be used to access the Published array "Accomodations" (defined in ModelData Swift file)
    
    @EnvironmentObject var accomodationModelData: AccomodationModelData
    
    var body: some View {
        
        // A NavigationStack is created to manage navigations to the AccomodationDetail Views.
        
        NavigationStack {
            
            // Here, a custom List View is used to display the array of accomodations from the Accomodations array. This Array is accessed from the EnvironmentObject accomodationModelData. For each item in the Accomodations array, The NavigationLink to the AccomodationDetail view is defined and the label which is the AccomodationRow view is defined.
            
            List(accomodationModelData.Accomodations) { Accomodation in
                
                NavigationLink(destination: AccomodationDetail(accomodation: Accomodation), label: {
                    AccomodationRow(accomodation: Accomodation)
                })             
            }
            .navigationTitle("Accomodations")
            
            // The navigation Title is set.
        }
    }
}

struct AccomodationList_Previews: PreviewProvider {
    
    static var previews: some View {
        AccomodationList()
            .environmentObject(AccomodationModelData())
        
        // The preview is provided with the AccomodationModelData() environment Object. 
    }
}
