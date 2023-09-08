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
        
        HStack {
            
            activity.image
                .resizable()
                .frame(width: 50, height: 50)
            
            Text(activity.name)
            
            Spacer()
        }
    }
}

struct ActivityRow_Previews: PreviewProvider {
    
    static var Activities = ModelData().Activities
    
    static var previews: some View {
        ActivityRow(activity: ModelData().Activities[0])
            .previewLayout(.fixed(width: 300, height: 70))
    }
}
