//
//  TripScreen.swift
//  CarryOn
//
//  Created by Giulia Stefainski on 08/08/25.
//

import SwiftUI
import SwiftData

struct TripScreen: View {
    
    @State var importItems: Bool = false
    @State var emptyState: Bool = true
    @State var addItem: Bool = true
    @State var selectedCategory: ItemCategory?
    
   var trip: Trip
    
    var body: some View {
        VStack {
            VStack(spacing: 22) {
                Text(trip.name)
                    .font(.system(.title3, weight: .semibold))
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .navigationTitle("Lista de viagem")
            .navigationBarTitleDisplayMode(.inline)
        }
        .onAppear {
        }
//        .sheet(isPresented: $addItem) { // $ binding<bool>: observable
//            AddItem(selectedCategory: $selectedCategory)
//                .presentationDragIndicator(.visible)
//                .presentationDetents([.medium])
//        }
//        .navigationDestination(item: $selectedCategory) { category in
//            CategoryList(category: category)
//                .onDisappear {
//                    addItem = true
//                }
//        }
    }
}
