//
//  ImageView.swift
//  IOS_Advanced_Assignment_2
//
//  Created by vinay bayyapunedi on 08/09/23.
//

import SwiftUI

struct ImageView: View {
    
    var image: Image // A stored image property is added
    
    var body: some View {
        
        image
            .resizable()
            .frame(width: 300, height: 200)
            .clipShape(Circle())
            .overlay {
                Circle().stroke(.white, lineWidth: 5)
            }
            .shadow(radius: 7)
        
    }
}

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        ImageView(image: Image("goldenGateBridge"))
    }
}
