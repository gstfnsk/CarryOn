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
        VStack(spacing: 48) {
            VStack(spacing: 22) {
                Text("Criar lista de viagem")
                    .font(.system(.title3, weight: .semibold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                ButtonComponent(text: "Criar nova lista") {
                    createList = true
                }.padding(48)
            }
            
            Text("Minhas viagens")
                .font(.system(.title3, weight: .semibold))
                .frame(maxWidth: .infinity, alignment: .leading)
            ForEach(trips) { trip in
                ButtonComponent(text: trip.name) {
                }
            }
        }
        .padding(.top, 20)
        .padding(.horizontal, 16)
        .navigationTitle("Vai viajar?")
        .sheet(isPresented: $createList) {
            NavigationView {
                CreateTrip()
            }.presentationDragIndicator(.visible)
        }
    }
}

#Preview {
    //    NavigationStack{
    Trips()
    
    //    }
}
