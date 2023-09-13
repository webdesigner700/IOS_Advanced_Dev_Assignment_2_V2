//
//  LocationDetail.swift
//  IOS_Advanced_Assignment_2
//
//  Created by vinay bayyapunedi on 08/09/23.
//

import SwiftUI
import MapKit

struct LocationDetail: View {
    var body: some View {
        
        NavigationStack {
            
            
            VStack {
                
                ScrollView {
                    
                    
                    
                    MapView(coordinate: CLLocationCoordinate2D(latitude: 37.773972, longitude: -122.431297))
                        .frame(height: 300)
                        .ignoresSafeArea(edges: .top)
                    
                    ImageView(image: Image("sanFrancisco"))
                        .offset(y: -120)
                        .padding(.bottom, -130)
                    
                    VStack() {
                        
                        Text("San Francisco")
                            .font(.title)
                            .fontWeight(.bold)
                            .padding(.vertical, 9.0)
                        
                        HStack {
                            Text("California")
                                .font(.title2)
                            
                            Spacer()
                            
                            Text("USA")
                                .font(.title2)
                            
                        }
                        .padding()
                    }
                    
                    NavigationLink(destination: ActivityList(), label: {
                        Text("Show Activities")
                    })
                    .frame(height: 40.0)
                    
                    VStack(alignment: .leading) {
                        
                        Text("Description")
                            .font(.title3)
                            .multilineTextAlignment(.center)
                        
                        
                        Text("San Francisco, officially the City and County of San Francisco, is the commercial, financial, and cultural center of Northern California. The city proper is the fourth most populous city in California, with 808,437 residents, and the 17th most populous city in the United States as of 2022. The city covers a land area of 46.9 square miles (121 square kilometers) at the end of the San Francisco Peninsula, making it the second most densely populated large U.S. city after New York City and the fifth-most densely populated U.S. county, behind only four of the five New York City boroughs. Among the 91 U.S. cities proper with over 250,000 residents, San Francisco was ranked first by per capita income[25] and sixth by aggregate income as of 2021. Colloquial nicknames for San Francisco include Frisco, San Fran, The City, and SF.")
                            .font(.body)
                    }
                    .padding()
                    
                    
                }
            }
        }
    }
}

struct LocationDetail_Previews: PreviewProvider {
    static var previews: some View {
        LocationDetail()
    }
}
