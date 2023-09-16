//
//  AccomodationDetail.swift
//  IOS_Advanced_Assignment_2
//
//  Created by vinay bayyapunedi on 09/09/23.
//

import SwiftUI

struct AccomodationDetail: View {
    
    // The variable accomodationModelData is accessed through the environment. This variable can be used to access the Published array "Accomodations" (defined in ModelData Swift file)
    
    @EnvironmentObject var accomodationModelData: AccomodationModelData
    
    // The "accomodation" variable stores the accomodation sample data provided by the Preview Provider initializer.
    
    var accomodation: Accomodation
    
    var accomodationIndex: Int? {
    
        if let index = accomodationModelData.Accomodations.firstIndex(where: {$0.id == accomodation.id}) {
            return index
        }
        else {
            
            // The else case handles the case where no match for the index is found
            
            return nil
        }
        
        // This computes the index of the "accomodation" variable by comparing it to the accomodationModelData accomodation array
        
        // The closure { $0.id == accomodation.id} checks if the "id" property of the "accomodation" variable matches the id property of any of the accomodation elements in the accomodationModelData.Accomodations array.
        
    }
    
    // These are State properties created to control the alerts for adding/removing an accomodation to the Favourites List
    
    @State private var addingToFavourites: Bool = false
    
    @State private var notAddingToFavourites: Bool = false
    
    var body: some View {
        
        NavigationStack {
            
            VStack(spacing: 16) {
                
                // A map is displayed using the custom MapView component. This custom view is created in the "MapView" SwiftUI file. The parameter values provided for MapView are obtained from the "accomodation" variable
                
                MapView(coordinate: accomodation.accomodationCoordinate)
                    .frame(height: 200)
                    .cornerRadius(16)
                
                // An image is displayed using the custom ImageView component. The imageView component takes in a parameter of the type "Image". The name for this parameter type is provided by the "acomodation" variable. The various modifiers used to display the image can be accessed through the ImageView SwiftUI file.
                
                ImageView(image: accomodation.image)
                    .offset(y: -120)
                    .padding(.bottom, -120)
                
                // The VStack below shows the name of the accomodation, the district and the city the accomodation is in.
                
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
                
                // The if else clause is used to display a button to the user that can be used to add the accomodation to their Favourites list or remove it from it.
                
                // The if clause checks if the inItinerary property of the "accomodation" is true or not. If true, the user will see a button to remove the accomodation from their favourites list. If the inItinerary property is false, the user will see a button to add the accomodation to their favourites list.
                    
                if (accomodation.inItinerary) {
                    
                    // If the accomodation is already in the itinerary
                    
                    HStack {
                        Button(action: {
                            
                            // The state property notAddingToFavourites turns true
                            
                            notAddingToFavourites = true
                            
                            // The "inItinerary" property of the "accomodation" is toggled when the button is pressed. (That is, it turns from true to false)
                            
                            accomodationModelData.Accomodations[accomodationIndex ?? 0].inItinerary.toggle()
                            
                            
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
                        
                        // The above code from line 104 represents the label for the button. The alert on line 117 is presented to the user notifying them that the accomodation has been removed from their itinerary
                    }
                    .background(
                        Rectangle()
                            .stroke(Color.blue, lineWidth: 2) // Adjust color and line width as needed
                    )
                }
                else {
                    
                    // If the accomodation is not in the Itinerary
                    
                    HStack {
                        Button(action: {
                            
                            // The State property addingToFavourites turns true
                            
                            addingToFavourites = true
                            
                            // The "inItinerary" property of the "accomodation" is toggled when the button is pressed. (That is, it turns from false to true)
                            
                            accomodationModelData.Accomodations[accomodationIndex ?? 0].inItinerary.toggle()
                            
                            
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
                        
                        // The above code from line 152 represents the label for the button. The alert on line 165 is presented to the user notifying them that the accomodation has been added to their itinerary
                    }
                    .background(
                        Rectangle()
                            .stroke(Color.blue, lineWidth: 2) // Adjust color and line width as needed
                    )
                }
                
                // The below VStack displays the description section of the accomodation
                
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
    
    // A static instance of the AccomodationModelData class is created for the preview.
    
    static let Accomodations = AccomodationModelData().Accomodations
    
    static var previews: some View {
        AccomodationDetail(accomodation: Accomodations[2])
            .environmentObject(AccomodationModelData())
        
        // The preview is provided with an accomodation from the array Accomodations which is accessed through the static instance variable "accomodationModelData".
    }
}
