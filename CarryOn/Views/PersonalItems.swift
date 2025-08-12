//
//  PersonalItems.swift
//  CarryOn
//
//  Created by Giulia Stefainski on 05/08/25.
//

import SwiftUI
import SwiftData

struct PersonalItems: View {
    
    
    @State var addItem: Bool = true
    @State var emptyState: Bool = true
    @State var selectedCategory: ItemCategory?
    
    
    @State var selectedItems: [Item] = []
    @State var itemsToRemove: [Item] = []
    
    @Query var pickedItems: [PickedItems]
    
    @Environment(\.modelContext) var modelContext
    
    var body: some View {
        VStack {
            VStack(spacing: 22) {
                Text("Minha lista de indispensáveis")
                    .font(.system(.title3, weight: .semibold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                if let firstPicked = pickedItems.first {
                    List(firstPicked.items) { item in
                        Text(item.name)
                    }
                } else {
                    PersonalItemsEmpty()
                }
            }
            .navigationTitle("Itens essenciais")
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
            addItem = true
        }
        .sheet(isPresented: $addItem) { // $ binding<bool>: observable
            AddItem(selectedCategory: $selectedCategory)
                .presentationDragIndicator(.visible)
                .presentationDetents([.medium])
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

//#Preview {
//    PersonalItems()
//}
