//
//  Trips.swift
//  CarryOn
//
//  Created by Giulia Stefainski on 05/08/25.
//

import SwiftUI
import SwiftData

struct Trips: View {
    
    @State var createList: Bool = false
    @Query var trips: [Trip]
    
    var body: some View {
        VStack {
            CreateTrip()
            
        }
        .navigationTitle("Vai viajar?")
        .sheet(isPresented: $createList) { // $ binding<bool>: observable
            CreateTrip()
                .presentationDragIndicator(.visible)
        }
        
    }
}

//#Preview {
//    Trips()
//}
