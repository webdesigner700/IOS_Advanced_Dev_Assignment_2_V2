//
//  AccomodationDetail.swift
//  IOS_Advanced_Assignment_2
//
//  Created by vinay bayyapunedi on 09/09/23.
//

import SwiftUI

struct AccomodationDetail: View {
    
    @EnvironmentObject var accomodationModelData: AccomodationModelData
    
    var accomodation: Accomodation
    
    var accomodationIndex: Int {
    
        accomodationModelData.Accomodations.firstIndex(where: {$0.id == accomodation.id})!
        
    }
    
    @State private var isPresentingMessage: Bool = false
    
    var body: some View {
        
        NavigationStack {
            
            VStack {
                
                MapView(coordinate: accomodation.accomodationCoordinate)
                    .frame(height: 300)
                    .ignoresSafeArea(edges: .top)
                
                ImageView(image: accomodation.image)
                    .offset(y: -120)
                    .padding(.bottom, -130)
                
                VStack() {
                    
                    Text(accomodation.name)
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(.vertical, 9.0)
                    
                    HStack {
                        Text(accomodation.district)
                            .font(.title2)
                        
                        Spacer()
                        
                        Text(accomodation.city)
                            .font(.title2)
                        
                    }
                    .padding()
                }
                
                HStack {
                    Button(action: {
                            
                            
                        isPresentingMessage = true
                            
                        accomodationModelData.Accomodations[accomodationIndex].inItinerary.toggle()
                        
                        
                    }) {
                        HStack {
                            Image(systemName: "plus.circle")
                            
                            Text("Add to Favourites")
                                .fontWeight(.semibold)
                                .font(.title2)
                        }
                    }
                    .padding(.horizontal, 16)
                    .padding(.vertical, 8)
                    .alert(isPresented: $isPresentingMessage, content: {
                        Alert(
                            title: Text("Added"),
                            message: Text("You have successfully added this accomodation to your itinerary"),
                            dismissButton: .default(Text("OK"))
                        )
                        
                    })
                }
                .background(
                    Rectangle()
                        .stroke(Color.blue, lineWidth: 2) // Stroke style
                )
                
                VStack(alignment: .leading) {
                    
                    Text("Description")
                        .font(.title3)
                        .multilineTextAlignment(.center)
                    
                    
                    Text(accomodation.description)
                        .font(.body)
                }
                .padding()
            }
        }
        
    }
}

struct AccomodationDetail_Previews: PreviewProvider {
    
    static let Accomodations = AccomodationModelData().Accomodations
    
    static var previews: some View {
        AccomodationDetail(accomodation: Accomodations[1])
            .environmentObject(AccomodationModelData())
    }
}
