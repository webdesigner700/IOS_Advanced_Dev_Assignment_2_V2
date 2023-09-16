//
//  AccomodationRow.swift
//  IOS_Advanced_Assignment_2
//
//  Created by vinay bayyapunedi on 09/09/23.
//

import SwiftUI

struct AccomodationRow: View {
    
    // The "accomodation" variable stores the accomodation sample data provided by the Preview Provider initializer.
    
    var accomodation: Accomodation
    
    var body: some View {
        
        // A HStack is created to represent a row of information about an accomodation.
        
        HStack() {
            
            accomodation.image
                .resizable()
                .frame(width: 120, height: 120)
                .cornerRadius(10)
                .shadow(radius: 5)
            
            
            VStack(alignment: .leading) {
                
                Text(accomodation.name)
                    .font(.headline)
                    .foregroundColor(.primary)
                
                Text(accomodation.district)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
        }
    }
}

struct AccomodationRow_Previews: PreviewProvider {
    
    // A static variable called "Accomodations" is created that will hold the Accomodations Array accessed from the AccomodationModelData Observable Object.
    
    static var Accomodations = AccomodationModelData().Accomodations
    
    
    static var previews: some View {
        AccomodationRow(accomodation: Accomodations[0])
        
        // An accomodation sample data is passed as an initializer for the preview from the Accomodations Array.
    }
}
