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
    @State var selectedTrip: Trip? = nil
    
    var body: some View {
        ZStack {
            Color.backgroundPrimary
                .ignoresSafeArea()
            VStack(spacing: 48) {
                VStack(spacing: 24) {
                    Text("Criar lista de viagem")
                        .font(.system(.title3, weight: .semibold))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    ButtonComponent(text: "Criar nova lista") {
                        createList = true
                    }
                }
                VStack(spacing: 24) {
                    Text("Minhas viagens")
                        .font(.system(.title3, weight: .semibold))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    //                    .padding()
                    
                    if (!trips.isEmpty) {
                        //                            ScrollView {
                        //                                VStack {
                        ForEach(trips) { trip in
                            TripCardComponent(text: trip.name) {
                                selectedTrip = trip
                            }.frame(height: 103)
                        }
                        Spacer()
                    }
                    else {
                        TripEmptyState()
                    }
                }
            }
            .padding(.top, 250)
            
            .background(
                Image("BackgroundTrips")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea(edges: .top)
            )
            .padding(.top, 20)
            .padding(.horizontal, 16)
            .navigationTitle("Vai viajar?")
            .navigationBarTitleDisplayMode(.large)
            .toolbarBackground(Color.clear, for: .navigationBar)
            
            .sheet(isPresented: $createList) {
                NavigationView {
                    CreateTrip()
                }.presentationDragIndicator(.visible)
            }
            .navigationDestination(item: $selectedTrip) { trip in
                TripScreen(trip: trip)
            }
        }
    }
}

#Preview {
    //    NavigationStack{
    //    Trips()
    
    //    }
}
