//
//  TripScreen.swift
//  CarryOn
//
//  Created by Giulia Stefainski on 08/08/25.
//

import SwiftUI
import SwiftData

struct TripScreen: View {
    
    @State var showDialog = false
    @State var addItem: Bool = true
    @State var selectedCategory: ItemCategory?
    
    @State var selectedItems: [Item] = []
    @State var itemsToRemove: [Item] = []
    
   var trip: Trip
    
    var body: some View {
        VStack {
            VStack(spacing: 22) {
                Text(trip.name)
                    .font(.system(.title3, weight: .semibold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                // ver se trip.items é vazio ou n:
                if trip.items.isEmpty{
                    TripEmptyState()
                    ButtonComponent(text: "Importar lista") {
                        showDialog = true
                    }
                }
                
            }
            .padding()
            .confirmationDialog(
                        "Importar lista",
                        isPresented: $showDialog,
                        titleVisibility: .visible
                    ) {
                        Button("Importar dos itens essenciais") {
                            print("Opção 1 escolhida")
                        }
                        
                        Button("Importar de outra viagem") {
                            print("Opção 2 escolhida")
                        }
                        
                        Button("Cancelar", role: .cancel) {
                            print("Cancelar")
                        }
                    } message: {
                        Text("Escolha de onde importar sua lista")
                    }
            .navigationTitle("Lista de viagem")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        addItem = true
                    } label: {
                        Text("Adicionar itens")
                    }
                }
            }
        }
        .onAppear {
        }
        .sheet(isPresented: $addItem) { // $ binding<bool>: observable
            AddItem(selectedCategory: $selectedCategory)
                .presentationDragIndicator(.visible)
                .presentationDetents([.medium])
        }
//        .navigationDestination(item: $selectedCategory) { category in
//            CategoryList(category: category)
//                .onDisappear {
//                    addItem = true
//                }
//        }
    }
}
