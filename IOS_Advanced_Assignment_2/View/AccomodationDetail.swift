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
                    .frame(height: 40.0)
                    .fontWeight(.semibold)
                    .font(.title2)
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
