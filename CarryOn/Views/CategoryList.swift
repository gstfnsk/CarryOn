//
//  CategoryList.swift
//  CarryOn
//
//  Created by Giulia Stefainski on 06/08/25.
//

import SwiftUI
import SwiftData

struct CategoryList: View {
    
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) var dismiss
    
    @Binding var selectedItems: [Item]
    @Binding var itemsToRemove: [Item]
    
    var category : ItemCategory
    
    @Query var allItems: [Item]
    
    var body: some View {
        VStack {
            List(allItems) { item in
                if (item.category.contains(category)) {
                    HStack {
                        Text(item.name)
                            .listRowSeparator(.hidden, edges:.bottom)
                        Button {
                            if let index = selectedItems.firstIndex(where: { $0.id == item.id }) {
                                selectedItems.remove(at: index)
                                itemsToRemove.append(item)
                            } else {
                                selectedItems.append(item)
                            }
                        } label: {
                            if selectedItems.contains(where: { $0.id == item.id }) {
                                Image(systemName: "checkmark")
                            }
                        }
                    }
                }
            }
        }
        .background(Color.backgroundPrimary)
        .navigationTitle(category.rawValue)
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            if allItems.isEmpty {
                for item in Item.predefinedItems {
                    modelContext.insert(item)
                }
                do {
                    try modelContext.save()
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
        .navigationBarBackButtonHidden(true)
        
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button{
                    dismiss()
                } label: {
                    Label ("", systemImage: "chevron.left")
                }
            }
        }
    }
}


//#Preview {
//    CategoryList()
//}
