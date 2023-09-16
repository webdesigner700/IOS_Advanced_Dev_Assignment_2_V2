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
    
    @State private var addingToFavourites: Bool = false
    
    @State private var notAddingToFavourites: Bool = false
    
    var body: some View {
        
        NavigationStack {
            
            VStack(spacing: 16) {
                
                MapView(coordinate: accomodation.accomodationCoordinate)
                    .frame(height: 200)
                    .cornerRadius(16)
                
                ImageView(image: accomodation.image)
                    .offset(y: -120)
                    .padding(.bottom, -120)
                
                VStack() {
                    
                    Text(accomodation.name)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding(.vertical, 5)
                    
                    HStack {
                        Text(accomodation.district)
                            .font(.headline)
                        
                        Spacer()
                        
                        Text(accomodation.city)
                            .font(.headline)
                        
                    }
                    .padding([.leading, .bottom, .trailing], 12)
                }
                .padding(.horizontal, 16)
                    
                    // This button appears only if the accomodation is not in favourites
                    
                if (accomodation.inItinerary) {
                    // If the accomodation is already in the itinerary
                    HStack {
                        Button(action: {
                            
                            notAddingToFavourites = true
                            
                            accomodationModelData.Accomodations[accomodationIndex].inItinerary.toggle()
                            
                            
                        }) {
                            HStack {
                                Image(systemName: "minus.circle")
                                
                                Text("Remove from Favourites")
                                    .fontWeight(.semibold)
                                    .font(.title2)
                            }
                        }
                        .padding(.horizontal, 16)
                        .padding(.vertical, 8)
                        .frame(height: 40.0)
                        .fontWeight(.semibold)
                        .font(.title2)
                        .alert(isPresented: $notAddingToFavourites, content: {
                            Alert(
                                title: Text("Removed"),
                                message: Text("You have successfully removed this accomodation from your itinerary"),
                                dismissButton: .default(Text("OK"))
                            )
                            
                        })
                    }
                    .background(
                        Rectangle()
                            .stroke(Color.blue, lineWidth: 2) // Adjust color and line width as needed
                    )
                }
                else {
                    HStack {
                        Button(action: {
                            
                            
                            addingToFavourites = true
                            
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
                        .frame(height: 40.0)
                        .fontWeight(.semibold)
                        .font(.title2)
                        .alert(isPresented: $addingToFavourites, content: {
                            Alert(
                                title: Text("Added"),
                                message: Text("You have successfully added this accomodation to your itinerary"),
                                dismissButton: .default(Text("OK"))
                            )
                            
                        })
                    }
                    .background(
                        Rectangle()
                            .stroke(Color.blue, lineWidth: 2) // Adjust color and line width as needed
                    )
                }
                // This is the HStack bracket
                
                VStack(alignment: .leading, spacing: 8) {
                    
                    Text("Description")
                        .font(.title3)
                        .multilineTextAlignment(.center)
                    
                    
                    Text(accomodation.description)
                        .font(.body)
                }
                .padding()
                .background(
                    Rectangle()
                        .fill(Color(hue: 0.678, saturation: 0.08, brightness: 0.861))
                )
            }
            
            .navigationBarTitle("Accomodation Details", displayMode: .inline)
        }
    }
}

struct AccomodationDetail_Previews: PreviewProvider {
    
    static let Accomodations = AccomodationModelData().Accomodations
    
    static var previews: some View {
        AccomodationDetail(accomodation: Accomodations[2])
            .environmentObject(AccomodationModelData())
    }
}
