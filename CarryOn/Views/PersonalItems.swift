//
//  PersonalItems.swift
//  CarryOn
//
//  Created by Giulia Stefainski on 05/08/25.
//

import SwiftUI
import SwiftData

struct PersonalItems: View {
    
    @State var addItem: Bool = false
    @State var selectedCategory: ItemCategory?
    
    @State var selectedItems: [Item] = []
    @State var itemsToRemove: [Item] = []
    
    @Query var pickedItems: [PickedItems]
    
    @Environment(\.modelContext) var modelContext
    
    var body: some View {
        ZStack {
            Color.backgroundPrimary
                .ignoresSafeArea()
            VStack {
                VStack(spacing: 22) {
                    Text("Minha lista de indispensáveis")
                        .font(.system(.title3, weight: .semibold))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal, 16)
                        .padding(.top, 20)
                    
                    if let firstPicked = pickedItems.first, !firstPicked.items.isEmpty {
                        
                        List(firstPicked.items) { item in
                            Text(item.name) // lista os itens
                                .swipeActions(edge: .trailing) {
                                    Button("Delete", systemImage: "trash", role: .destructive) {
                                        if let index = firstPicked.items.firstIndex(where: { $0.id == item.id }) {
                                            firstPicked.items.remove(at: index)
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
                        
                    } else {
                        VStack(spacing: 64){
                            PersonalItemsEmpty()
                            ButtonComponent(text: "Adicionar itens") {
                                addItem = true
                            }.padding(.horizontal)
                        }
                    }
                    Spacer()
                }
                .navigationTitle("Itens essenciais")
                .toolbarBackground(Color.backgroundPrimary, for: .navigationBar)
                .toolbarBackground(.visible, for: .tabBar)
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button {
                            addItem = true
                        } label: {
                            Image(systemName: "plus")
                        }
                    }
                }
            }
            
            .background(Color.backgroundPrimary)
            .onAppear {
                addItem = true
            }
            .sheet(isPresented: $addItem) { // $ binding<bool>: observable
                AddItem(showTripType: false, selectedCategory: $selectedCategory) { newItem in
                    if let firstPicked = pickedItems.first {
                        firstPicked.items.append(newItem)
                        try? modelContext.save()
                    }
                }
                    .presentationDragIndicator(.visible)
                    .presentationDetents([.height(210)])
            }
            .navigationDestination(item: $selectedCategory) { category in
                
                let existingItems = pickedItems.first?.items ?? []
                
                CategoryList(selectedItems: $selectedItems, itemsToRemove: $itemsToRemove, category: category)
                    .onAppear() {
                        selectedItems = existingItems
                    }
                    .onDisappear {
                        
                        addItem = true
                        
                        let picked: PickedItems
                        if let existingPicked = pickedItems.first {
                            picked = existingPicked
                            
                            let currentItems = Set(picked.items)
                            let newItems = Set(selectedItems)
                            let combinedItems = currentItems.union(newItems)
                            
                            picked.items = Array(combinedItems)
                            picked.items.removeAll { item in
                                itemsToRemove.contains(where: { $0.id == item.id })
                            }
                        } else {
                            picked = PickedItems(items: selectedItems)
                            modelContext.insert(picked)
                        }
                        try? modelContext.save()
                        itemsToRemove.removeAll()
                    }
            }
        }
    }
}

//#Preview {
//    PersonalItems()
//}
