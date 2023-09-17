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
        
        // The image is displayed with the following modifiers.
        
        image
            .resizable() // make the image resizable
            .frame(width: 300, height: 200) // Define the frame size of the image
            .clipShape(Circle()) // Clip the image into a circular shape
            .overlay {
                Circle().stroke(.white, lineWidth: 5)
            }
            .shadow(radius: 7) // Apply a shadow effect to the image
        
    }
}

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        ImageView(image: Image("handleryUnionSqaure"))
        
        // A preview of the "ImageView" with a sample image named "handleryUnionSqaure" is displayed
    }
}
