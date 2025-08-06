//
//  Trips.swift
//  CarryOn
//
//  Created by Giulia Stefainski on 05/08/25.
//

import SwiftUI

struct Trips: View {
    
    @State var createList: Bool = false
    @State var trips: [Trip] = []
    
    var body: some View {
        VStack {
            CreateTrip(trips: $trips)
            
        }
        .navigationTitle("Vai viajar?")
        .sheet(isPresented: $createList) { // $ binding<bool>: observable
            CreateTrip(trips: $trips)
                .presentationDragIndicator(.visible)
        }
        
    }
}

#Preview {
    Trips()
}
