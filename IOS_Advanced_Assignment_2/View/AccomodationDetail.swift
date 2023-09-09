//
//  AccomodationDetail.swift
//  IOS_Advanced_Assignment_2
//
//  Created by vinay bayyapunedi on 09/09/23.
//

import SwiftUI

struct AccomodationDetail: View {
    
    var accomodation: Accomodation
    
    var body: some View {
        
        NavigationStack {
            
            VStack {
                
                MapView(coordinate: accomodation.accomodationCoordinate)
                    .frame(height: 300)
                    .ignoresSafeArea(edges: .top)
                
                ImageView(image: accomodation.image)
                    .offset(y: -120)
                    .padding(.bottom, -130)
                
                VStack() {
                    
                    Text(accomodation.name)
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(.vertical, 9.0)
                    
                    HStack {
                        Text(accomodation.district)
                            .font(.title2)
                        
                        Spacer()
                        
                        Text(accomodation.city)
                            .font(.title2)
                        
                    }
                    .padding()
                }
                
                VStack(alignment: .leading) {
                    
                    Text("Description")
                        .font(.title3)
                        .multilineTextAlignment(.center)
                    
                    
                    Text(accomodation.description)
                        .font(.body)
                }
                .padding()
            }
        }
    }
}

struct AccomodationDetail_Previews: PreviewProvider {
    static var previews: some View {
        AccomodationDetail(accomodation: Accomodations[0])
    }
}
