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
        
        // A NavigationStack is created to manage the navigation to ActivityList
        
        NavigationStack {
            
            // A VStack is created to show all the content on the screen with proper spacing
                
            VStack(spacing: 16) {
                
                // A map is displayed using the custom "MapView()" SwfitUI view. This custom view is created in the MapView SwiftUI file. The parameter values provided for this MapView custom view are the coordinates for San Francisco.
                
                MapView(coordinate: CLLocationCoordinate2D(latitude: 37.773972, longitude: -122.431297))
                    .frame(height: 250)
                    .ignoresSafeArea(edges: .top)
                
                // The ImageView custom view is used to display an image of San Francisco. The image of San Francisco can be foudn in the assets folder. The various modifiers used to display the image can be accessed through the ImageView SwiftUI file.
                
                ImageView(image: Image("sanFrancisco"))
                    .offset(y: -120)
                    .padding(.bottom, -130)
                
                // The VStack below shows "San Francisco" as the headline and the state and country teh city is in.
                
                
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
                .padding(.horizontal, 16)
                
                // A NavigationLink is created that navigates to the ActivityList View. The destination View and the label for the navigation link is defined.
                
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
                
                // The below VStack displays the description section of San Francisco.
                
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

struct LocationDetail_Previews: PreviewProvider {
    static var previews: some View {
        LocationDetail()
    }
}
