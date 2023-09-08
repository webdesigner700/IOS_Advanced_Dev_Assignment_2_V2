//
//  ActivityDetail.swift
//  IOS_Advanced_Assignment_2
//
//  Created by vinay bayyapunedi on 08/09/23.
//

import SwiftUI

struct ActivityDetail: View {
    
    var activity: Activity
    
    var body: some View {
        
        ScrollView() {
            
            MapView(coordinate: activity.activityCoordinate)
                .frame(height: 300)
                .ignoresSafeArea(edges: .top)
            
            ImageView(image: activity.image)
                .offset(y: -120)
                .padding(.bottom, -130)
            
            VStack() {
                
                Text(activity.name)
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.vertical, 9.0)
                
                HStack {
                    Text(activity.city)
                        .font(.title2)
                    
                    Spacer()
                    
                    Text(activity.state)
                        .font(.title2)
                    
                }
                .padding()
            }
            
            
            
            
            
            
            VStack(alignment: .leading) {
                
                Text("Description")
                    .font(.title3)
                    .multilineTextAlignment(.center)
                
                
                Text(activity.description)
                    .font(.body)
            }
            .padding()
            
            
        }
    }
}

struct ActivityDetail_Previews: PreviewProvider {
    static var previews: some View {
        ActivityDetail(activity: Activities[0])
    }
}
