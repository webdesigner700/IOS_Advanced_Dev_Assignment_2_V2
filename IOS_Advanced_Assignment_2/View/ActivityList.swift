//
//  ActivityList.swift
//  IOS_Advanced_Assignment_2
//
//  Created by vinay bayyapunedi on 08/09/23.
//

import SwiftUI

struct ActivityList: View {
    
    @EnvironmentObject var activityModelData: ActivityModelData
    
    var body: some View {
        
        
        NavigationStack {
            
            List(activityModelData.Activities) { Activity in
                
                NavigationLink(destination: ActivityDetail(activity: Activity), label: {
                    ActivityRow(activity: Activity)
                })
  
            }
            .navigationTitle("Activities")
        }
    }
}

struct ActivityList_Previews: PreviewProvider {
    
    static let activityModelData = ActivityModelData()
    
    static var previews: some View {
        ActivityList()
            .environmentObject(ActivityModelData())
    }
}
