//
//  AccomodationRow.swift
//  IOS_Advanced_Assignment_2
//
//  Created by vinay bayyapunedi on 09/09/23.
//

import SwiftUI

struct AccomodationRow: View {
    
    var accomodation: Accomodation
    
    var body: some View {
        
        HStack {
            
            accomodation.image
                .resizable()
                .frame(width: 50, height: 50)
            
            Text(accomodation.name)
            
            Spacer()
        }
    }
}

struct AccomodationRow_Previews: PreviewProvider {
    
    static var Accomodations = AccomodationModelData().Accomodations
    
    // The reason this static variable is initialised in this file is becuase we want an individual accomodation data from the model data.
    
    static var previews: some View {
        AccomodationRow(accomodation: Accomodations[0])
    }
}
