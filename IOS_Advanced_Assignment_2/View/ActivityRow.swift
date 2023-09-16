//
//  ActivityRow.swift
//  IOS_Advanced_Assignment_2
//
//  Created by vinay bayyapunedi on 08/09/23.
//

import SwiftUI

struct ActivityRow: View {
    
    // The "activity" variable stores the activity sample data provided by the Preview Provider initializer.
    
    var activity: Activity
    
    var body: some View {
        
        // A HStack is created to represent a row of information about an activity.
        
        HStack() {
            
            activity.image
                .resizable()
                .frame(width: 120, height: 120)
                .cornerRadius(10)
                .shadow(radius: 5)
            
            VStack(alignment: .leading) {
                
                Text(activity.name)
                    .font(.headline)
                    .foregroundColor(.primary)
                
                Text(activity.city)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
        }
    }
    
}

struct ActivityRow_Previews: PreviewProvider {
    
    // A static variable called "Activies" is created that will hold the Activities Array accessed from the ActivityModelData Observable Objct.
    
    static var Activities = ActivityModelData().Activities
    
    static var previews: some View {
        ActivityRow(activity: Activities[0])
            .previewLayout(.sizeThatFits)
        
        // An activity sample data is passed as an initializer for the preview from the Activities Array.
    }
}
