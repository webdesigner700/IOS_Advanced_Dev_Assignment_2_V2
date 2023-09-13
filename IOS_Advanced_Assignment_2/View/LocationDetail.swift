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
            
            ScrollView(.vertical) {
                
                VStack(spacing: 16) {
                    
                    MapView(coordinate: CLLocationCoordinate2D(latitude: 37.773972, longitude: -122.431297))
                        .frame(height: 250)
                        .ignoresSafeArea(edges: .top)
                    
                    ImageView(image: Image("sanFrancisco"))
                        .offset(y: -120)
                        .padding(.bottom, -130)
                    
                    VStack() {
                        
                        Text("San Francisco")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .padding(.vertical, 5)
                        
                        HStack {
                            Text("California")
                                .font(.headline)
                            
                            Spacer()
                            
                            Text("USA")
                                .font(.headline)
                            
                        }
                        .padding(.horizontal, 16)
                    }
                    
                    NavigationLink(destination: ActivityList(), label: {
                        
                        
                        HStack {
                            Image(systemName: "figure.run.square.stack.fill")
                            Text("Show Activities")
                        }
                    })
                    .padding(.horizontal, 16)
                    .padding(.vertical, 8)
                    .frame(height: 40.0)
                    .fontWeight(.semibold)
                    .font(.title2)
                    .background(
                        Rectangle()
                            .stroke(Color.blue, lineWidth: 2) // Stroke style
                    )
                    
                    VStack(alignment: .leading, spacing: 8) {
                        
                        Text("Description")
                            .font(.title3)
                            .multilineTextAlignment(.center)
                        
                        
                        Text("San Francisco, officially the City and County of San Francisco, is the commercial, financial, and cultural center of Northern California. The city proper is the fourth most populous city in California, with 808,437 residents, and the 17th most populous city in the United States as of 2022.")
                            .font(.body)
                    }
                    .padding()
                    .background(
                        Rectangle()
                            .fill(Color(hue: 0.678, saturation: 0.08, brightness: 0.861)) // Stroke style
                    )
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
