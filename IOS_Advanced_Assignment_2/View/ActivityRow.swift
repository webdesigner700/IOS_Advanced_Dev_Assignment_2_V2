//
//  ActivityRow.swift
//  IOS_Advanced_Assignment_2
//
//  Created by vinay bayyapunedi on 08/09/23.
//

import SwiftUI

struct ActivityRow: View {
    
    var activity: Activity
    
    var body: some View {
        
        HStack() {
            
            activity.image
                .resizable()
                .frame(width: 140, height: 140)
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
    
    static var Activities = ActivityModelData().Activities
    
    static var previews: some View {
        ActivityRow(activity: Activities[0])
            .previewLayout(.sizeThatFits)
    }
}
