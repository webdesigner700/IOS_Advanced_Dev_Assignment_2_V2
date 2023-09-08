//
//  ActivityList.swift
//  IOS_Advanced_Assignment_2
//
//  Created by vinay bayyapunedi on 08/09/23.
//

import SwiftUI

struct ActivityList: View {
    var body: some View {
        
        
        NavigationStack {
            
            List(Activities) { Activity in
                
                NavigationLink(destination: ActivityDetail(activity: Activity), label: {
                    ActivityRow(activity: Activity)
                })
                
                
            }
            .navigationTitle("Activities")
        }
    }
}

struct ActivityList_Previews: PreviewProvider {
    static var previews: some View {
        ActivityList()
    }
}
