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
    @State var addItem: Bool = false
    @State var selectedCategory: ItemCategory?
    
    @Query var pickedItems: [PickedItems]
    
    @State var selectedItems: [Item] = []
    @State var itemsToRemove: [Item] = []
    
    @Environment(\.modelContext) var modelContext
    
    @State var tripAddItem: Trip?
    var trip: Trip
    
    var body: some View {
        VStack {
            VStack(spacing: 22) {
                Text(trip.name)
                    .font(.system(.title3, weight: .semibold))
                    .frame(maxWidth: .infinity, alignment: .center)
                // ver se trip.items é vazio ou n:
                if trip.items.isEmpty{
                    TripEmptyState()
                    ButtonComponent(text: "Importar lista") {
                        showDialog = true
                    }
                    ButtonComponent(text: "Adicionar itens") {
                        showDialog = false
                        addItem = true
                    }
                    Spacer()
                } else {
                    List(trip.items) { item in
                        Text(item.name) // lista os itens
                            .swipeActions(edge: .trailing) {
                                Button("Delete", systemImage: "trash", role: .destructive) {
                                    if let index = trip.items.firstIndex(where: { $0.id == item.id }) {
                                        trip.items.remove(at: index)
                                        try? modelContext.save()
                                    }
                                }
                            }
                    }.background(Color.backgroundPrimary)
                        .scrollContentBackground(.hidden)
                    Button {
                        addItem = true
                    } label: {
                        Image(systemName: "plus")  // símbolo do botão
                            .foregroundColor(.white)
                            .frame(width: 36, height: 36)
                            .background(Color.accentColor)
                            .clipShape(Circle())
                    }
                    Spacer()
                }
            }
            .padding()
            .confirmationDialog(
                "Importar lista",
                isPresented: $showDialog,
                titleVisibility: .visible
            ) {
                Button("Importar dos itens essenciais") {
                    if let firstPicked = pickedItems.first {
                        trip.items = firstPicked.items
                    }
                }
                //                        Button("Importar de outra viagem") {
                //                            //mostrar lista de viagens
                //                        }
                Button("Cancelar", role: .cancel) {
                    print("Cancelar")
                }
            } message: {
                Text("Escolha de onde importar sua lista")
            }
            .navigationTitle("Lista de viagem")
            .toolbarBackground(Color.backgroundPrimary, for: .navigationBar)
            .toolbarBackground(.visible, for: .tabBar)
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
        }.background(Color.backgroundPrimary)
        .onAppear {
        }
        .sheet(isPresented: $addItem) { // $ binding<bool>: observable
            AddItem(showTripType: true, selectedCategory: $selectedCategory) { newItem in
                trip.items.append(newItem)
                try? modelContext.save()
            }
                .presentationDragIndicator(.visible)
                .presentationDetents([.height(342)])
        }
        
                .navigationDestination(item: $selectedCategory) { category in
                    
                    let existingItems = trip.items
                    
                    CategoryList(selectedItems: $selectedItems, itemsToRemove: $itemsToRemove, category: category)
                        .onAppear(){
                            selectedItems = existingItems
                        }
                        .onDisappear {
                            addItem = true
                    
                                       let currentItems = Set(trip.items)
                                       let newItems = Set(selectedItems)
                                       let combinedItems = currentItems.union(newItems)

                                       trip.items = Array(combinedItems)

                                       trip.items.removeAll { item in
                                           itemsToRemove.contains(where: { $0.id == item.id })
                                       }

                                       try? modelContext.save()

                                       itemsToRemove.removeAll()
                        }
                }
        
    }
}
