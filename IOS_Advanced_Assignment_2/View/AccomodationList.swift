//
//  AccomodationList.swift
//  IOS_Advanced_Assignment_2
//
//  Created by vinay bayyapunedi on 09/09/23.
//

import SwiftUI

struct AccomodationList: View {
    var body: some View {
        
        NavigationStack {
            
            List(Accomodations) { Accomodation in
                
                NavigationLink(destination: AccomodationDetail(accomodation: Accomodation), label: {
                    AccomodationRow(accomodation: Accomodation)
                })
                
                
            }
            .navigationTitle("Accomodations")
        }
    }
}

struct AccomodationList_Previews: PreviewProvider {
    static var previews: some View {
        AccomodationList()
    }
}
