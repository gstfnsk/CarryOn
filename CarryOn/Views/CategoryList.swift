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
    
    var category : ItemCategory = .electronics
    //predefinedItems: [ItemCategory: [Item]
//    var items = Item.predefinedItems
    @Query var items: [Item]
    
    var body: some View {
        VStack {
            NavigationStack {
                ScrollView {
                    ForEach(items) { item in
                        Text(item.name)
                    }
                }
            }
        }
        .navigationTitle(category.rawValue)
        .onAppear {
            if items.isEmpty {
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
    }
}


#Preview {
    CategoryList()
}
